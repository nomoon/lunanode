# frozen_string_literal: true

require "json"
require "rest-client"

module Lunanode
  # Class for accessing the Lunanode API.
  #
  # The class is instantiated by either passing it a JSON file containing
  # the keys `api_id` and `api_key`, or specifying the ID and key directly:
  #   api = Lunanode::API.new("credentials_file.json")
  #   api = Lunanode::API.new(api_id: "ABCDEFG", api_key: "HIJKLMNOP")
  #
  # Once instantiated, action methods follow the example:
  #   api.vm_list # no parameters
  #   api.vm_info(vm_id: "My-VM-ID") # required parameters
  #   api.image_list(region: "Toronto") # optional parameters
  #
  # Required and optional arguments are specified in the method definitions,
  # but can can be queried via {API.params_for}. They follow the API
  # specification athttps://wiki.lunanode.com/index.php/API
  #
  class API
    #
    # Class-level definitions
    #

    API_ENDPOINT = "https://dynamic.lunanode.com/api/".freeze
    @params_for = {}

    # Show parameter info for any {API} instance method.
    #
    # The keys of the hash results denote the type of parameter:
    # - :keyreq  => Required keyword argument
    # - :key     => Optional keyword argument
    # - :keyrest => Arbitrary additional keyword arguments
    # - :req     => Required positional argument
    # - :opt     => Optional positional argument
    # - :rest    => Arbitrary additional positional arguments
    #
    # @param method_name[#to_sym] The name of the API method
    # @return [Hash] information about the method parameters.
    #
    def self.params_for(method_name)
      method_name = method_name.to_sym
      @params_for[method_name] ||= begin
        param_groups = instance_method(method_name).parameters.group_by(&:first)
        out = param_groups.map do |status, param_def|
          [status, param_def.map(&:last)]
        end
        out.to_h.each_value(&:freeze).freeze
      end
    end

    #
    # Instance-level definitions
    #

    include APIActions
    attr_reader :api_id

    # Instantiate an API object
    #
    # @return [API] an API instance.
    #
    # @overload initialize(credentials_file)
    #   Instantiate an API object from a credentials file.
    #   @param credentials_file[String,File] a JSON credentials file
    #     (which contains the keys `api_id` and `api_key`)
    #
    #   @raise [JSON::ParserError] if the JSON file could not be read properly.
    #   @raise [KeyError] if any required key could not be found.
    #
    # @overload initialize(api_id: , api_key: )
    #   Instantiate an API object from an API ID and API Key.
    #   @param api_id[String] A LunaNode API ID
    #   @param api_key[String] A LunaNode API Key
    #
    #   @raise [KeyError] if any required key could not be found.
    #
    def initialize(*args, **options)
      credentials_file = args.compact.first.to_s
      if File.exist?(credentials_file)
        credentials_data = File.read(credentials_file)
        options = JSON.parse(credentials_data, symbolize_names: true)
      end
      @api_id = options.fetch(:api_id).to_s.dup.freeze
      @api_key = options.fetch(:api_key).to_s.dup.freeze
      @rest_client = RestClient::Resource.new(
        API_ENDPOINT,
        verify_ssl: OpenSSL::SSL::VERIFY_PEER
      )
    end

    # Display a string representation of the object without key information.
    def inspect
      "#<#{self.class.name}: api_id=#{api_id.inspect}>"
    end
    alias to_s inspect

    # Send an arbitrary API action without any parameter checks.
    #
    # @param category[#to_sym] The API action category (i.e. dns, image, vm...)
    # @param action[#to_sym] The API action name (i.e. create, list...)
    # @param params[**Hash] Any parameters required for the action.
    #
    # @return [Hash,Array,String] Response data from the API action.
    # @raise [APIError] If there was a problem with the action.
    #
    def action(category, action, **params)
      resp = call_api("#{category}/#{action}/", params)
      raise APIError, resp[:error] unless resp.delete(:success) == "yes"

      if resp.size == 1
        resp.values.first
      else
        resp
      end
    end # :reek:FeatureEnvy

    private

    attr_reader :api_key, :rest_client

    # Make an API call and return response.
    def call_api(handler_path, params)
      req_url = "#{rest_client.url}#{handler_path}"
      req_formdata = auth_request_formdata(handler_path, clean_params(params))

      if $DEBUG
        STDERR.puts "call_api()\n" + JSON.pretty_generate(
          path: req_url,
          req: JSON.parse(req_formdata[:req]),
          signature: req_formdata[:signature],
          nonce: req_formdata[:nonce]
        )
      end

      response = rest_client[handler_path].post(req_formdata)
      JSON.parse(response, symbolize_names: true)
    rescue RestClient::Exception => err
      err.message += "\n  Request Path: #{req_url}" \
                     "\n  Request Data: #{req_data}"
      raise err
    end

    # Clean empty request parameters
    def clean_params(params)
      params.each_with_object({}) do |(param, value), acc|
        next unless param.respond_to?(:to_sym) && value.respond_to?(:to_s)
        acc[param.to_sym] = value.to_s
      end
    end # :reek:ManualDispatch

    # Create signed request data
    def auth_request_formdata(handler_path, params)
      req_msg = raw_request_message(params)
      nonce = gen_nonce
      signature = gen_signature(handler_path, req_msg, nonce)
      {
        req: req_msg,
        signature: signature,
        nonce: nonce,
      }
    end

    # Generate raw, unsigned request message.
    def raw_request_message(params)
      params[:api_id] = api_id
      params[:api_partialkey] = api_key.slice(0, 64)
      JSON.generate(params)
    end

    # Generate nonce for request
    def gen_nonce
      Time.now.utc.to_i.to_s
    end

    # Generate signature for request
    def gen_signature(handler_path, req_msg, nonce)
      message = "#{handler_path}|#{req_msg}|#{nonce}"
      OpenSSL::HMAC.hexdigest("SHA512", api_key, message)
    end
  end
end

# frozen_string_literal: true

require "json"
require "rest-client"

require "lunanode/api/actions"
require "lunanode/api/error"

module Lunanode
  class API
    #
    # Class-level definitions
    #

    API_ENDPOINT = "https://dynamic.lunanode.com/api/".freeze
    @params_for = {}

    # Show parameter info for api actions.
    #
    def self.params_for(method_name)
      @params_for[method_name] ||= begin
        method_name = method_name.to_sym
        param_groups = instance_method(method_name).parameters.group_by(&:first)
        out = {
          required: param_groups[:keyreq] && param_group[:keyreq].map(&:last),
          optional: param_groups[:key] && param_groups[:key].map(&:last),
          additional: param_groups.key?(:keyrest),
        }
        out.each do |k, v|
          if v
            v.freeze
          else
            out.delete(k)
          end
        end
        out.freeze
      end
    end

    #
    # Instance-level definitions
    #

    include Actions
    attr_reader :api_id

    # Instantiate an API object.
    #
    def initialize(credentials_file = nil, api_id: nil, api_key: nil)
      if !credentials_file.nil? && File.exist?(credentials_file)
        credentials_data = File.read(credentials_file)
        credentials = JSON.parse(credentials_data, symbolize_names: true)
        @api_id = credentials[:api_id]
        @api_key = credentials[:api_key]
      else
        @api_id = api_id
        @api_key = api_key
      end
      @api_id = @api_id.to_s.freeze
      @api_key = @api_key.to_s.freeze
      @rest_client = RestClient::Resource.new(
        API_ENDPOINT,
        verify_ssl: OpenSSL::SSL::VERIFY_PEER
      )
    end

    # Clean, safer inspection.
    #
    def inspect
      "#<#{self.class.name}: api_id=#{api_id.inspect}>"
    end
    alias to_s inspect

    # Send API action with parameters, return result data.
    #
    def action(category, action, **params)
      resp = call_api("#{category}/#{action}/", params)
      raise APIError, %("#{resp[:error]}") unless resp[:success] == "yes"
      resp.delete(:success)

      if resp.size == 1
        resp.values.first
      else
        resp
      end
    end

    # Delegate to ::params_for
    #
    def params_for(method_name)
      self.class.params_for(method_name)
    end

    private

    attr_reader :api_key, :rest_client

    # Make an API call and return response.
    #
    def call_api(handler_path, params)
      req_formdata = auth_request_formdata(handler_path, clean_params(params))
      JSON.parse(rest_client[handler_path].post(req_formdata),
                 symbolize_names: true)
    rescue RestClient::Exception => err
      err.message += "\n  Request Path: #{rest_client.url}#{handler_path}" \
                     "\n  Request Data: #{req_data}"
      raise err
    end

    # Clean empty request parameters
    #
    def clean_params(params)
      params.each_with_object({}) do |(k, v), acc|
        if k && k.respond_to?(:to_sym) && v && v.respond_to?(:to_s)
          acc[k.to_sym] = v.to_s
        end
      end
    end

    # Create signed request data
    #
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
    #
    def raw_request_message(params)
      params[:api_id] = api_id
      params[:api_partialkey] = api_key.slice(0, 64)
      params.to_json
    end

    # Generate nonce for request
    #
    def gen_nonce
      Time.now.utc.to_i.to_s
    end

    # Generate signature for request
    #
    def gen_signature(handler_path, req_msg, nonce)
      message = "#{handler_path}|#{req_msg}|#{nonce}"
      OpenSSL::HMAC.hexdigest("SHA512", api_key, message)
    end
  end
end

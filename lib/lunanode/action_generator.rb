# frozen_string_literal: true

require "yaml"

module Lunanode
  # Helper utility to generate ruby source module/method definitions for API
  # actions from a YAML file.
  #
  # It is not required by default and does not evaluate source. (See Rakefile.)
  module ActionGenerator
    module_function

    def api_data
      @api_data ||= YAML.safe_load(
        File.read("lunanode_api_def.yaml"),
        [String, Symbol]
      )
    end

    def generate_default_modules
      generate_categories(api_data)
    end

    UNSAFE_IDENTIFIER = /.{21,}|[^A-Za-z0-9_*]/

    def module_name(name)
      if name.length > 3
        name.capitalize
      else
        name.upcase
      end
    end

    def indent_lines(string)
      string.gsub(/^(?!$)/, "  ")
    end

    def check_safe!(identifier)
      raise "Unsafe name `#{identifier}`" if identifier =~ UNSAFE_IDENTIFIER
    end

    def generate_categories(data)
      (data.map do |category, actions|
        check_safe!(category)
        [category, generate_actions(category, actions)]
      end).to_h
    end

    def generate_actions(category, actions)
      actions = actions.map do |action, params|
        generate_action(category, action, params)
      end

      category_module = "module #{module_name(category)}\n" +
                        actions.map { |a| indent_lines(a) }.join("\n") +
                        "end\n"

      actions_module = "module APIActions\n" +
                       indent_lines(category_module) +
                       "end\n"

      src = "module #{name.split('::')[-2]}\n" +
            indent_lines(actions_module) +
            "end\n"

      "# frozen_string_literal: true\n\n#{src}"
    end

    def generate_action(category, action, params)
      check_safe!(action)
      params = params.to_h

      param_list_req = Array(params[:required])
      param_list_opt = Array(params[:optional])
      param_list = param_list_req + param_list_opt
      param_list.each { |p| check_safe!(p) }

      param_list_call_arr = param_list.map do |p|
        p.start_with?("**") ? p : "#{p}: #{p}"
      end

      param_list_req_sig_arr = param_list_req.map do |p|
        "#{p}:"
      end

      param_list_opt_sig_arr = param_list_opt.map do |p|
        p.start_with?("**") ? p : "#{p}: nil"
      end
      param_list_sig_arr = (param_list_req_sig_arr + param_list_opt_sig_arr)

      unless param_list.empty?
        param_list_call = ", #{param_list_call_arr.join(', ')}"
        param_list_sig = "(#{param_list_sig_arr.join(', ')})"
      end

      "def #{category}_#{action}#{param_list_sig}\n" \
      "  action(:#{category}, :#{action}#{param_list_call})\n" \
      "end\n"
    end

    private_constant :UNSAFE_IDENTIFIER
    private_class_method :check_safe!, :generate_categories, :generate_actions,
                         :generate_action
  end
end

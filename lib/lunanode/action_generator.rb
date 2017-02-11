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

    UNSAFE_IDENTIFIER = /.{21,}|[^A-Za-z0-9_*\-]/

    def check_safe!(identifier)
      raise "Unsafe name `#{identifier}`" if identifier =~ UNSAFE_IDENTIFIER
    end

    def indent_lines(string)
      string.gsub(/^(?!$)/, "  ")
    end

    def module_name(name)
      if name.length > 3
        name.capitalize
      else
        name.upcase
      end
    end

    def generate_categories(data)
      (data.map do |category, actions|
        check_safe!(category)
        [category, generate_actions(category, actions)]
      end).to_h
    end

    def generate_actions(category, actions)
      actions = actions.map do |action, params|
        indent_lines(generate_action(category, action, params))
      end

      category_mod = "module #{module_name(category)}\n" \
                     "#{actions.join("\n")}end\n"
      actions_mod = "module APIActions\n#{indent_lines(category_mod)}end\n"

      "# frozen_string_literal: true\n\n" \
      "module #{name.split('::')[-2]}\n#{indent_lines(actions_mod)}end\n"
    end

    def generate_param_list(params)
      params.to_h.each_with_object({}) do |(status, param_arr), acc|
        param_arr.each do |param|
          check_safe!(param)
          acc[param] = status
        end
      end
    end

    def generate_param_list_sig(param_list)
      param_list.map do |param, status|
        case status
        when :keyreq
          "#{param}:"
        when :key
          "#{param}: nil"
        when :keyrest
          "**#{param}"
        end
      end
    end

    def generate_param_list_call(param_list)
      param_list.map do |(param, status)|
        case status
        when :keyrest
          "**#{param}"
        else
          "#{param}: #{param}"
        end
      end
    end

    def generate_action(category, action, params)
      check_safe!(action)
      param_list = generate_param_list(params)

      unless param_list.empty?
        param_list_call = ", #{generate_param_list_call(param_list).join(', ')}"
        param_list_sig = "(#{generate_param_list_sig(param_list).join(', ')})"
      end

      "def #{category}_#{action.to_s.tr('-', '_')}#{param_list_sig}\n" \
      "  action(:#{category}, #{action.inspect}#{param_list_call})\n" \
      "end\n"
    end

    private_constant :UNSAFE_IDENTIFIER
    private_class_method :check_safe!, :indent_lines, :module_name,
                         :generate_categories, :generate_actions,
                         :generate_param_list, :generate_param_list_sig,
                         :generate_param_list_call, :generate_action
  end
end

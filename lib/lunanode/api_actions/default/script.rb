# frozen_string_literal: true

module Lunanode
  module APIActions
    module Script
      def script_list
        action(:script, :list)
      end

      def script_get(script_id:)
        action(:script, :get, script_id: script_id)
      end

      def script_create(name:, content:)
        action(:script, :create, name: name, content: content)
      end

      def script_update(script_id:, name:, content:)
        action(:script, :update, script_id: script_id, name: name, content: content)
      end

      def script_delete(script_id:)
        action(:script, :delete, script_id: script_id)
      end
    end
  end
end

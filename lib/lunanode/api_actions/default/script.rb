# frozen_string_literal: true

module Lunanode
  module APIActions
    module Script
      def script_list
        action(:script, :list)
      end
    end
  end
end

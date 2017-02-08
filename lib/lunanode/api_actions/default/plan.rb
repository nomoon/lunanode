# frozen_string_literal: true

module Lunanode
  module APIActions
    module Plan
      def plan_list
        action(:plan, :list)
      end
    end
  end
end

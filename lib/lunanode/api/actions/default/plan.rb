# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module Plan
        module Default
          def plan_list
            action(:plan, :list)
          end
        end
      end
    end
  end
end

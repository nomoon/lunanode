# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module Script
        module Default
          def script_list
            action(:script, :list)
          end
        end
      end
    end
  end
end

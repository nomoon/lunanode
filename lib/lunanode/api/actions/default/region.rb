# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module Region
        module Default
          def region_list
            action(:region, :list)
          end
        end
      end
    end
  end
end

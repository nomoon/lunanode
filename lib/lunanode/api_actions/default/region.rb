# frozen_string_literal: true

module Lunanode
  module APIActions
    module Region
      def region_list
        action(:region, :list)
      end
    end
  end
end

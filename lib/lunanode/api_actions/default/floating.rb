# frozen_string_literal: true

module Lunanode
  module APIActions
    module Floating
      def floating_list
        action(:floating, :list)
      end

      def floating_add(region:)
        action(:floating, :add, region: region)
      end

      def floating_delete(region:, ip:)
        action(:floating, :delete, region: region, ip: ip)
      end
    end
  end
end

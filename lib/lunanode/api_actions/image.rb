# frozen_string_literal: true
require "lunanode/api_actions/default/image"

module Lunanode
  module APIActions
    module Image
      # Contents may extend or overwrite methods from the default module.

      # Filters {#image_list} results for user's account images only.
      def image_list_mine(region: nil)
        image_list(region: region).select do |image|
          image[:image_id].to_i > 9999
        end
      end
    end
  end
end

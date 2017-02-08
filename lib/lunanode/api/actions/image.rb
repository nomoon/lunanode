# frozen_string_literal: true
require "lunanode/api/actions/default/image"

module Lunanode
  class API
    module Actions
      module Image
        include Default

        # Filter image list of Lunanode-supplied images.
        #
        def image_list_mine(region: nil)
          image_list(region: region).select do |image|
            image[:image_id].to_i > 9999
          end
        end
      end
    end
  end
end

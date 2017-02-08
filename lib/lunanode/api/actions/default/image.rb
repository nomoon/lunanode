# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module Image
        module Default
          def image_list(region: nil)
            action(:image, :list, region: region)
          end

          def image_delete(image_id:)
            action(:image, :delete, image_id: image_id)
          end

          def image_details(image_id:)
            action(:image, :details, image_id: image_id)
          end

          def image_replicate(image_id:, region:)
            action(:image, :replicate, image_id: image_id, region: region)
          end

          def image_fetch(region:, name:, location:, format:, virtio: nil)
            action(:image, :fetch, region: region, name: name,
                                   location: location, format: format,
                                   virtio: virtio)
          end

          def image_retrieve(image_id:)
            action(:image, :retrieve, image_id: image_id)
          end
        end
      end
    end
  end
end

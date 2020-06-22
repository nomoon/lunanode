# frozen_string_literal: true

module Lunanode
  module APIActions
    module Volume
      def volume_list
        action(:volume, :list)
      end

      def volume_create(region:, label:, size:, image: nil, snapshot_id: nil)
        action(:volume, :create, region: region, label: label, size: size, image: image, snapshot_id: snapshot_id)
      end

      def volume_delete(volume_id:)
        action(:volume, :delete, volume_id: volume_id)
      end

      def volume_attach(volume_id:, vm_id:, target:)
        action(:volume, :attach, volume_id: volume_id, vm_id: vm_id, target: target)
      end

      def volume_detach(volume_id:)
        action(:volume, :detach, volume_id: volume_id)
      end

      def volume_info(volume_id:)
        action(:volume, :info, volume_id: volume_id)
      end

      def volume_extend(volume_id:, size:)
        action(:volume, :extend, volume_id: volume_id, size: size)
      end

      def volume_snapshot_create(volume_id:, label:)
        action(:volume, :"snapshot-create", volume_id: volume_id, label: label)
      end

      def volume_snapshot_delete(region:, snapshot_id:)
        action(:volume, :"snapshot-delete", region: region, snapshot_id: snapshot_id)
      end

      def volume_snapshot_list(region:)
        action(:volume, :"snapshot-list", region: region)
      end

      def volume_snapshot_replicate(region:, snapshot_id:, image_name:, dst_region:)
        action(:volume, :"snapshot-list", region: region, snapshot_id: snapshot_id, image_name: image_name, dst_region: dst_region)
      end

      def volume_rename(volume_id:, name:)
        action(:volume, :rename, volume_id: volume_id, name: name)
      end
    end
  end
end

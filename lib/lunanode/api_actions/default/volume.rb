# frozen_string_literal: true

module Lunanode
  module APIActions
    module Volume
      def volume_list(region:)
        action(:volume, :list, region: region)
      end

      def volume_create(region:, label:, size:, image: nil, snapshot_id: nil)
        action(:volume, :create, region: region, label: label, size: size, image: image, snapshot_id: snapshot_id)
      end

      def volume_delete(region:, volume_id:)
        action(:volume, :delete, region: region, volume_id: volume_id)
      end

      def volume_attach(region:, volume_id:, vm_id:, target:)
        action(:volume, :attach, region: region, volume_id: volume_id, vm_id: vm_id, target: target)
      end

      def volume_detach(region:, volume_id:)
        action(:volume, :detach, region: region, volume_id: volume_id)
      end

      def volume_info(region:, volume_id:)
        action(:volume, :info, region: region, volume_id: volume_id)
      end

      def volume_extend(region:, volume_id:, size:)
        action(:volume, :extend, region: region, volume_id: volume_id, size: size)
      end

      def volume_snapshot_create(region:, volume_id:, label:)
        action(:volume, :"snapshot-create", region: region, volume_id: volume_id, label: label)
      end

      def volume_snapshot_delete(region:, snapshot_id:)
        action(:volume, :"snapshot-delete", region: region, snapshot_id: snapshot_id)
      end

      def volume_snapshot_list(region:)
        action(:volume, :"snapshot-list", region: region)
      end
    end
  end
end

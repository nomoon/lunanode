# frozen_string_literal: true

module Lunanode
  module APIActions
    module DNS
      def dns2_zone_list
        action(:dns2, :"zone-list")
      end

      def dns2_zone_add(name:, ttl:)
        action(:dns2, :"zone-add", name: name, ttl: ttl)
      end

      def dns2_zone_remove(zone_id:)
        action(:dns2, :"zone-remove", zone_id: zone_id)
      end

      def dns2_record_list(zone_id:)
        action(:dns, :"record-list", zone_id: zone_id)
      end

      def dns2_record_add(zone_id:, name:, data:, ttl:, type:, policy: nil, weight: nil, region: nil, regiongroup: nil, country: nil, continent: nil, global: nil, latitude: nil, longitude: nil, aux: nil, monitor_id: nil, orig_record_id: nil)
        action(:dns, :"record-add", zone_id: zone_id, name: name, data: data, ttl: ttl, type: type)
      end

      def dns2_record_remove(zone_id:, record_id:)
        action(:dns2, :"record-remove", zone_id: zone_id, record_id: record_id)
      end

      def dns_dyn_list
        action(:dns, :"dyn-list")
      end

      def dns_dyn_add(name:, ip:)
        action(:dns, :"dyn-add", name: name, ip: ip)
      end

      def dns_dyn_update(dyn_id:, name:, ip:)
        action(:dns, :"dyn-update", dyn_id: dyn_id, name: name, ip: ip)
      end

      def dns_dyn_remove(dyn_id:)
        action(:dns, :"dyn-remove", dyn_id: dyn_id)
      end
    end
  end
end

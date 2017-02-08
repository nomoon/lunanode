# frozen_string_literal: true

module Lunanode
  module APIActions
    module DNS
      def dns_list
        action(:dns, :list)
      end

      def dns_set(ip:, hostname:)
        action(:dns, :set, ip: ip, hostname: hostname)
      end

      def dns_zone_list
        action(:dns, :zone_list)
      end

      def dns_zone_add(origin:, ttl: nil)
        action(:dns, :zone_add, origin: origin, ttl: ttl)
      end

      def dns_zone_remove(zone_id:)
        action(:dns, :zone_remove, zone_id: zone_id)
      end

      def dns_record_list(zone_id:)
        action(:dns, :record_list, zone_id: zone_id)
      end

      def dns_record_add(zone_id:, name:, data:, ttl:, type:)
        action(:dns, :record_add, zone_id: zone_id, name: name, data: data, ttl: ttl, type: type)
      end

      def dns_record_remove(record_id:)
        action(:dns, :record_remove, record_id: record_id)
      end

      def dns_dyn_list
        action(:dns, :dyn_list)
      end

      def dns_dyn_add(name:, ip:)
        action(:dns, :dyn_add, name: name, ip: ip)
      end

      def dns_dyn_update(dyn_id:, name:, ip:)
        action(:dns, :dyn_update, dyn_id: dyn_id, name: name, ip: ip)
      end

      def dns_dyn_remove(dyn_id:)
        action(:dns, :dyn_remove, dyn_id: dyn_id)
      end
    end
  end
end

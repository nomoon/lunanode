# frozen_string_literal: true

module Lunanode
  module APIActions
    module Securitygroup
      def securitygroup_list
        action(:securitygroup, :list)
      end

      def securitygroup_create(region:, name:)
        action(:securitygroup, :create, region: region, name: name)
      end

      def securitygroup_delete(region:, group_id:)
        action(:securitygroup, :delete, region: region, group_id: group_id)
      end

      def securitygroup_rename(region:, group_id:, name:)
        action(:securitygroup, :rename, region: region, group_id: group_id, name: name)
      end

      def securitygroup_rule_list(region:, group_id:)
        action(:securitygroup, :rule_list, region: region, group_id: group_id)
      end

      def securitygroup_rule_insert(region:, group_id:, direction:, type:, protocol:, remote_type:, remote_value:, port_min: nil, port_max: nil, label: nil)
        action(:securitygroup, :rule_insert, region: region, group_id: group_id, direction: direction, type: type, protocol: protocol, remote_type: remote_type, remote_value: remote_value, port_min: port_min, port_max: port_max, label: label)
      end

      def securitygroup_rule_delete(region:, group_id:, rule_id:)
        action(:securitygroup, :rule_delete, region: region, group_id: group_id, rule_id: rule_id)
      end
    end
  end
end

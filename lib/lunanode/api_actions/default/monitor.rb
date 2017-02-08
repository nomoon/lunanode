# frozen_string_literal: true

module Lunanode
  module APIActions
    module Monitor
      def monitor_check_list
        action(:monitor, :check_list)
      end

      def monitor_check_types
        action(:monitor, :check_types)
      end

      def monitor_check_add(name:, type:, fail_count:, success_count:, check_interval:, **from_check_type)
        action(:monitor, :check_add, name: name, type: type, fail_count: fail_count, success_count: success_count, check_interval: check_interval, **from_check_type)
      end

      def monitor_check_remove(check_id:)
        action(:monitor, :check_remove, check_id: check_id)
      end

      def monitor_contact_list
        action(:monitor, :contact_list)
      end

      def monitor_contact_add
        action(:monitor, :contact_add)
      end

      def monitor_contact_remove(type:, rel:)
        action(:monitor, :contact_remove, type: type, rel: rel)
      end

      def monitor_alert_list(check_id:)
        action(:monitor, :alert_list, check_id: check_id)
      end

      def monitor_alert_add(check_id:, contact_id:)
        action(:monitor, :alert_add, check_id: check_id, contact_id: contact_id)
      end

      def monitor_alert_remove(alert_id:)
        action(:monitor, :alert_remove, alert_id: alert_id)
      end
    end
  end
end

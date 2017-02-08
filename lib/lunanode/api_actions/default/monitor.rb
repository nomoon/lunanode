# frozen_string_literal: true

module Lunanode
  module APIActions
    module Monitor
      def monitor_check_list
        action(:monitor, :"check-list")
      end

      def monitor_check_types
        action(:monitor, :"check-types")
      end

      def monitor_check_add(name:, type:, fail_count:, success_count:, check_interval:, **from_check_type)
        action(:monitor, :"check-add", name: name, type: type, fail_count: fail_count, success_count: success_count, check_interval: check_interval, **from_check_type)
      end

      def monitor_check_remove(check_id:)
        action(:monitor, :"check-remove", check_id: check_id)
      end

      def monitor_contact_list
        action(:monitor, :"contact-list")
      end

      def monitor_contact_add
        action(:monitor, :"contact-add")
      end

      def monitor_contact_remove(type:, rel:)
        action(:monitor, :"contact-remove", type: type, rel: rel)
      end

      def monitor_alert_list(check_id:)
        action(:monitor, :"alert-list", check_id: check_id)
      end

      def monitor_alert_add(check_id:, contact_id:)
        action(:monitor, :"alert-add", check_id: check_id, contact_id: contact_id)
      end

      def monitor_alert_remove(alert_id:)
        action(:monitor, :"alert-remove", alert_id: alert_id)
      end
    end
  end
end

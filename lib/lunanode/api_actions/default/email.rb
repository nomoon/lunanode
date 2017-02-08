# frozen_string_literal: true

module Lunanode
  module APIActions
    module Email
      def email_usage
        action(:email, :usage)
      end

      def email_domain_list
        action(:email, :"domain-list")
      end

      def email_domain_add(name:)
        action(:email, :"domain-add", name: name)
      end

      def email_domain_remove(domain_id:)
        action(:email, :"domain-remove", domain_id: domain_id)
      end

      def email_domain_dkim_set(domain_id:, selector:, private_key:)
        action(:email, :"domain-dkim-set", domain_id: domain_id, selector: selector, private_key: private_key)
      end

      def email_domain_dkim_unset(domain_id:)
        action(:email, :"domain-dkim-unset", domain_id: domain_id)
      end

      def email_user_list(domain_id:)
        action(:email, :"user-list", domain_id: domain_id)
      end

      def email_user_add(domain_id:, username:, password:)
        action(:email, :"user-add", domain_id: domain_id, username: username, password: password)
      end

      def email_user_set_password(domain_id:, user_id:, password:)
        action(:email, :"user-set-password", domain_id: domain_id, user_id: user_id, password: password)
      end

      def email_user_remove(domain_id:, user_id:)
        action(:email, :"user-remove", domain_id: domain_id, user_id: user_id)
      end

      def email_alias_list(domain_id:)
        action(:email, :"alias-list", domain_id: domain_id)
      end

      def email_alias_add(domain_id:, name:, target:)
        action(:email, :"alias-add", domain_id: domain_id, name: name, target: target)
      end

      def email_alias_remove(domain_id:, alias_id:)
        action(:email, :"alias-remove", domain_id: domain_id, alias_id: alias_id)
      end
    end
  end
end

# frozen_string_literal: true

module Lunanode
  module APIActions
    module SshKey
      def sshkey_add(label:, sshkey:)
        action(:sshkey, :add, label: label, sshkey: sshkey)
      end

      def sshkey_list
        action(:sshkey, :list)
      end

      def sshkey_remove(key_id:)
        action(:sshkey, :remove, key_id: key_id)
      end
    end
  end
end

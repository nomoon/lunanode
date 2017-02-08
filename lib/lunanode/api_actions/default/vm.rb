# frozen_string_literal: true

module Lunanode
  module APIActions
    module VM
      def vm_start(vm_id:)
        action(:vm, :start, vm_id: vm_id)
      end

      def vm_stop(vm_id:)
        action(:vm, :stop, vm_id: vm_id)
      end

      def vm_reboot(vm_id:)
        action(:vm, :reboot, vm_id: vm_id)
      end

      def vm_diskswap(vm_id:)
        action(:vm, :diskswap, vm_id: vm_id)
      end

      def vm_info(vm_id:)
        action(:vm, :info, vm_id: vm_id)
      end

      def vm_delete(vm_id:)
        action(:vm, :delete, vm_id: vm_id)
      end

      def vm_reimage(vm_id:, image_id:)
        action(:vm, :reimage, vm_id: vm_id, image_id: image_id)
      end

      def vm_resize(vm_id:, plan_id:)
        action(:vm, :resize, vm_id: vm_id, plan_id: plan_id)
      end

      def vm_rescue(vm_id:)
        action(:vm, :rescue, vm_id: vm_id)
      end

      def vm_vnc(vm_id:)
        action(:vm, :vnc, vm_id: vm_id)
      end

      def vm_floatingip_add(vm_id:, ip: nil, private_ip: nil)
        action(:vm, :floatingip_add, vm_id: vm_id, ip: ip, private_ip: private_ip)
      end

      def vm_floatingip_delete(vm_id:, ip: nil, keep: nil)
        action(:vm, :floatingip_delete, vm_id: vm_id, ip: ip, keep: keep)
      end

      def vm_iplist(vm_id:)
        action(:vm, :iplist, vm_id: vm_id)
      end

      def vm_ip_add(vm_id:, ip: nil)
        action(:vm, :ip_add, vm_id: vm_id, ip: ip)
      end

      def vm_ip_delete(vm_id:, ip:)
        action(:vm, :ip_delete, vm_id: vm_id, ip: ip)
      end

      def vm_securitygroup_add(vm_id:, group_id:)
        action(:vm, :securitygroup_add, vm_id: vm_id, group_id: group_id)
      end

      def vm_securitygroup_remove(vm_id:, group_id:)
        action(:vm, :securitygroup_remove, vm_id: vm_id, group_id: group_id)
      end

      def vm_create(hostname:, plan_id:, image_id:, region: nil, ip: nil, net_id: nil, securitygroups: nil, scripts: nil, volume_id: nil, volume_virtio: nil, key_id: nil, set_password: nil, affinity_group: nil)
        action(:vm, :create, hostname: hostname, plan_id: plan_id, image_id: image_id, region: region, ip: ip, net_id: net_id, securitygroups: securitygroups, scripts: scripts, volume_id: volume_id, volume_virtio: volume_virtio, key_id: key_id, set_password: set_password, affinity_group: affinity_group)
      end

      def vm_snapshot(vm_id:, name:)
        action(:vm, :snapshot, vm_id: vm_id, name: name)
      end

      def vm_list
        action(:vm, :list)
      end

      def vm_shelve(vm_id:)
        action(:vm, :shelve, vm_id: vm_id)
      end

      def vm_unshelve(vm_id:)
        action(:vm, :unshelve, vm_id: vm_id)
      end

      def vm_rename(vm_id:, hostname:)
        action(:vm, :rename, vm_id: vm_id, hostname: hostname)
      end
    end
  end
end

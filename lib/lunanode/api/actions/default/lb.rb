# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module LB
        module Default
          def lb_list(region:, net_id: nil)
            action(:lb, :list, region: region, net_id: net_id)
          end

          def lb_create(region:, net_id:, name:, method:, protocol:,
                        connection_limit:, port:)
            action(:lb, :create, region: region, net_id: net_id, name: name,
                                 method: method, protocol: protocol,
                                 connection_limit: connection_limit, port: port)
          end

          def lb_delete(region:, lb_id:)
            action(:lb, :delete, region: region, lb_id: lb_id)
          end

          def lb_info(region:, lb_id:)
            action(:lb, :info, region: region, lb_id: lb_id)
          end

          def lb_member_add(region:, lb_id:, ip:, port:)
            action(:lb, :member_add, region: region, lb_id: lb_id, ip: ip,
                                     port: port)
          end

          def lb_member_remove(region:, lb_id:, member_id:)
            action(:lb, :member_remove, region: region, lb_id: lb_id,
                                        member_id: member_id)
          end

          def lb_associate(region:, lb_id:, ip:)
            action(:lb, :associate, region: region, lb_id: lb_id, ip: ip)
          end
        end
      end
    end
  end
end

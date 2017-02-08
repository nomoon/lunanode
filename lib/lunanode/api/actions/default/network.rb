# frozen_string_literal: true

module Lunanode
  class API
    module Actions
      module Network
        module Default
          def network_list(region: nil)
            action(:network, :list, region: region)
          end

          def network_create(region:, name:, subnet:, dns:)
            action(:network, :create, region: region, name: name,
                                      subnet: subnet, dns: dns)
          end

          def network_delete(region:, net_id:)
            action(:network, :delete, region: region, net_id: net_id)
          end
        end
      end
    end
  end
end

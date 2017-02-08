# frozen_string_literal: true

require "lunanode/api/actions/dns"
require "lunanode/api/actions/email"
require "lunanode/api/actions/floating"
require "lunanode/api/actions/image"
require "lunanode/api/actions/lb"
require "lunanode/api/actions/monitor"
require "lunanode/api/actions/network"
require "lunanode/api/actions/plan"
require "lunanode/api/actions/region"
require "lunanode/api/actions/script"
require "lunanode/api/actions/securitygroup"
require "lunanode/api/actions/vm"
require "lunanode/api/actions/volume"

module Lunanode
  class API
    module Actions
      include DNS
      include Email
      include Floating
      include Image
      include LB
      include Monitor
      include Network
      include Plan
      include Script
      include Securitygroup
      include VM
      include Volume
    end
  end
end

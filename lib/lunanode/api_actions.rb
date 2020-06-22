# frozen_string_literal: true

require "lunanode/api_actions/dns"
require "lunanode/api_actions/email"
require "lunanode/api_actions/floating"
require "lunanode/api_actions/image"
require "lunanode/api_actions/lb"
require "lunanode/api_actions/monitor"
require "lunanode/api_actions/network"
require "lunanode/api_actions/plan"
require "lunanode/api_actions/region"
require "lunanode/api_actions/script"
require "lunanode/api_actions/securitygroup"
require "lunanode/api_actions/vm"
require "lunanode/api_actions/volume"
require "lunanode/api_actions/sshkey"
require "lunanode/api_actions/billing"

module Lunanode
  # Module containing all API action methods included from various component
  # modules.
  #
  # Standard API action methods were automatically generated from a datafile to
  # specifying all required and optional parameters as keyword arguments.
  #
  # See https://wiki.lunanode.com/index.php/API for more details on the
  # individual actions and parameters.
  module APIActions
    # Modules are included in reverse order so that YARD shows them correctly.
    include Volume
    include VM
    include Securitygroup
    include Script
    include Plan
    include Network
    include Monitor
    include LB
    include Image
    include Floating
    include Email
    include DNS
    include SshKey
    include Billing
  end
end

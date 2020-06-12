# frozen_string_literal: true

module Lunanode
  module APIActions
    module Billing
      def billing_credit
        action(:billing, :credit)
      end
    end
  end
end

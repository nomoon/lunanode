# frozen_string_literal: true
require "cgi"

module Lunanode
  # A RuntimeError raised when the API call returns unsuccessfully.
  class APIError < RuntimeError
    def to_s
      CGI.unescapeHTML(super)
    end
  end
end

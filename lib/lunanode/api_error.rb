# frozen_string_literal: true
require "cgi"
require "json"

module Lunanode
  # A RuntimeError raised when the API call returns unsuccessfully.
  class APIError < RuntimeError
    def to_s
      unescaped = CGI.unescapeHTML(super)
      return unescaped unless unescaped.start_with?("\"{")
      JSON.pretty_generate(JSON.parse(unescaped.gsub(/\A"|"\z/, "")))
    rescue JSON::ParserError
      unescaped
    end
  end
end

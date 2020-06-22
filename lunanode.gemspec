# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lunanode/version"

Gem::Specification.new do |spec|
  spec.name          = "lunanode"
  spec.version       = Lunanode::VERSION
  spec.authors       = ["Tim Bellefleur"]
  spec.email         = ["nomoon@phoebus.ca"]

  spec.summary       = "Luna Node API for Ruby"
  spec.homepage      = "https://github.com/nomoon/lunanode"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.1.0"

  spec.add_dependency "rest-client", "~> 2.1.0"

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "yard", "~> 0.9.25"
  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_development_dependency "reek", "~> 6.0.1"
  spec.add_development_dependency "rubocop", "~> 0.85.1"
  spec.add_development_dependency "rubocop-rspec", "~> 1.40.0"
end

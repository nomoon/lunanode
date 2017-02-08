# frozen_string_literal: true
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Generates default actions modules from API spec YAML file."
task :generate_default_api_modules do
  require "lunanode/action_generator"
  modules = Lunanode::ActionGenerator.generate_default_modules
  modules.each do |category, module_s|
    filename = "lib/lunanode/api_actions/default/#{category}.rb"
    raise "File already exists: #{filename}" if File.exist?(filename)
    bytes = File.write(filename, module_s)
    puts "File written: #{filename} (#{bytes} bytes)"
  end
end

task default: :spec

# frozen_string_literal: true
require "bundler/gem_tasks"
require "reek/rake/task"
require "rubocop/rake_task"
require "rspec/core/rake_task"

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

RuboCop::RakeTask.new do |t|
  t.fail_on_error = false
end

RSpec::Core::RakeTask.new(:spec)

desc "Generates default actions modules from API spec YAML file."
task :generate_default_api_modules do
  require "lunanode/action_generator"
  modules = Lunanode::ActionGenerator.generate_default_modules
  modules.each do |category, module_s|
    filename = "lib/lunanode/api_actions/default/#{category}.rb"
    existing_data = File.read(filename) if File.exist?(filename)
    if module_s == existing_data
      puts "File unchanged: #{filename}"
    else
      puts "File written: #{filename} (#{File.write(filename, module_s)} bytes)"
    end
  end
end

task default: %i[reek rubocop spec]

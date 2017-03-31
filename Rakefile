require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yard-ghpages'

RSpec::Core::RakeTask.new(:spec)

task test: :spec
task default: :spec

Yard::GHPages::Tasks.install_tasks

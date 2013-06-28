require 'rake'
require 'rdoc/task'
require './app/models/diogo'

Dir["#{File.dirname(__FILE__)}/lib/tasks/**/*.rake"].sort.each { |ext| load ext }

begin
  require 'rspec/core'
  require 'rspec/core/rake_task'
  desc "Run all specs in spec directory (excluding plugin specs)"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler/setup'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || ENV["RACK_ENV"] || "development"
  Dir.glob(File.join("models/**")) { |f| require "./#{f}" }
end

desc "Report code statistics"
  task :stats do
    require './vendor/code_statistics'
    
    STATS_DIRECTORIES = [
      %w(Controllers        app/controllers),
      %w(Helpers            app/helpers),
      %w(App             app/),
      %w(Views              app/views),
      %w(Test                spec/)
    ].collect { |name, dir| [ name, "./#{dir}" ] }.select { |name, dir| File.directory?(dir) }

    CodeStatistics.new(*STATS_DIRECTORIES).to_s
  end
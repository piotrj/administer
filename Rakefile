# encoding: utf-8
require 'rubygems'
require 'rake'

require 'rspec/core/rake_task'
require 'cucumber'
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %[--color]
  t.verbose = false
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default do
  Dir.chdir('spec/rails_root/') do
    Rake::Task['spec'].invoke
    Rake::Task['features'].invoke
  end
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "administer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

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
  t.cucumber_opts = "spec/rails_root/features --format pretty"
end

task :default => [:spec, :features]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "administer"
    gem.summary = "Automatic admin interface generation"
    gem.description = ""
    gem.email = ["piotrj@gmail.com", "balinski@gmail.com"]
    gem.homepage = "http://github.com/piotrj/administer"
    gem.authors = ["Piotr Jakubowski", "Marcin Baliński"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "administer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

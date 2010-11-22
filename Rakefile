# encoding: utf-8
require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "administer"
    gem.summary = "Automatic admin interface generation"
    gem.description = ""
    gem.email = ["piotrj@gmail.com", "balinski@gmail.com"]
    gem.homepage = "http://github.com/piotrj/administer"
    gem.authors = ["Piotr Jakubowski", "Marcin Baliński"]
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

# encoding: utf-8
require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'bundler'
Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["--color", "--format documentation"]
end

task :features do
  Dir.chdir('spec/rails_root/') do
    system('rake cucumber')
  end
end

namespace :db do
  task :migrate do
    Dir.chdir('spec/rails_root/') do
      system('rake db:migrate')
    end
  end
end

task :default => [:spec, :features]

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "administer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

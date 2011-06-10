# encoding: utf-8
require 'rubygems'
require 'rake'

task :spec do
  Dir.chdir('spec/rails_root/') do
    system('rake spec')
  end
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

task :default do
  Rake::Task['spec'].invoke
  Rake::Task['features'].invoke
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "administer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

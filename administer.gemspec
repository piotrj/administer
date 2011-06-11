Gem::Specification.new do |s|
  s.name = %q{administer}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = %q{1.3.7}

  s.authors = ["Piotr Jakubowski", "Marcin Bali\u0144ski"]
  s.date = %q{2010-12-06}
  s.email = ["piotrj@gmail.com", "balinski@gmail.com"]
  s.homepage = %q{http://github.com/piotrj/administer}
  s.summary = %q{Automatic admin interface generation}
  s.description = %q{}

  s.files = Dir.glob("{app,config,lib}/**/*")
  s.test_files = Dir.glob("spec/**/*")
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails', '~> 3.0.3'
  s.add_runtime_dependency 'haml', ">= 3.0.18"
  s.add_runtime_dependency 'superclass_hash'

  s.add_development_dependency 'autotest'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails', '>= 2.1.0'
  s.add_development_dependency 'cucumber', '>= 0.10.6'
  s.add_development_dependency 'cucumber-rails', '>= 0.5.2'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'capybara', '>= 0.4.1'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'sqlite3'
end

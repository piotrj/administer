require "administer"
require "rails"
require "haml"
require "superclass_hash"

module Administer
  class Engine < Rails::Engine
    initializer "administer.initiailze_orm", :after => :finisher_hook do
      require File.expand_path("active_record", File.dirname(__FILE__))
    end
  end
end

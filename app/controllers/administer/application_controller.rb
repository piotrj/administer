module Administer
  class ApplicationController < ::ApplicationController
    layout 'administer'

    before_filter :configured_filter

    private
    def configured_filter
      self.send(:test_authorization)
    end
  end
end

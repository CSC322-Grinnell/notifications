require "authlogic/test_case"

World(Authlogic::TestCase)

ApplicationController.skip_before_filter :activate_authlogic

Before do
  activate_authlogic
end

module Authlogic
  module Session
    module Activation
      module ClassMethods
        def controller
          if !Thread.current[:authlogic_controller]
            Thread.current[:authlogic_controller] = Authlogic::TestCase::MockController.new
          end
          Thread.current[:authlogic_controller]
        end
      end
    end
  end
end
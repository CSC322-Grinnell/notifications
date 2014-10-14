class User < ActiveRecord::Base
    attr_accessible :firstName, :lastName, :phone, :email, :type
end

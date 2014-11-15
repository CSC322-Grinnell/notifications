class User < ActiveRecord::Base
attr_accessible :name, :email, :password, :password_confirmation
  acts_as_authentic do |c|
    c.login_field = 'email'

  end # block optional

end
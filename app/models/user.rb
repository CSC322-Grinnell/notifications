class User < ActiveRecord::Base

attr_accessible :login, :email, :persistence_token, :name, :password, :password_confirmation,
:crypted_password, :admin, :classroom, :id
#attr_accessor :password, :password_confirmation, :crypted_password
 acts_as_authentic do |c|
    c.login_field = :email

  end # block optional

validates_inclusion_of :admin, :in => [true, false]
end

class User < ActiveRecord::Base
  attr_accessible :login, :email, :persistence_token, :name, :password, :password_confirmation,
  :crypted_password, :admin, :phone_number, :classroom_ids
  #attr_accessor :password, :password_confirmation, :crypted_password
 acts_as_authentic do |c|
    c.login_field = :email

  end # block optional

  validates_presence_of :name, :message => "can't be blank"
  validates_inclusion_of :admin, :in => [true, false]
  validates_confirmation_of :password, :message => "Passwords aren't the same"
  validates_presence_of :password_confirmation, :message => "can't be blank"
  has_and_belongs_to_many :classrooms

  def getClassrooms
    if self.admin == true
      return Classroom.all
    else
      return self.classrooms
    end
  end

end

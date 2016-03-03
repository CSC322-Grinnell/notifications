class Message < ActiveRecord::Base
   attr_accessible :contents, :user

   has_many :student
end

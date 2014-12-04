class Text < ActiveRecord::Base
   attr_accessible :number, :message
   has_many :student
end

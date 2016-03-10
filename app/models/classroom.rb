class Classroom < ActiveRecord::Base
  attr_accessible :name, :user_ids
   validates_presence_of :name, :message => "can't be blank"
  has_and_belongs_to_many :students
  has_and_belongs_to_many :users
end


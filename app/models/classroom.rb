class Classroom < ActiveRecord::Base
  attr_accessible :name, :user_ids
  has_and_belongs_to_many :students
  has_and_belongs_to_many :users
end

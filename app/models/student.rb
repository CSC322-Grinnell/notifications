class Student < ActiveRecord::Base
  attr_accessible :student_name, :classroom_ids, :contact_ids

  validates_presence_of :student_name, :message => "can't be blank"
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :contacts
end

class Student < ActiveRecord::Base
  attr_accessible :Student_Name, :classroom_ids, :contact_ids

  validates_presence_of :Student_Name, :message => "can't be blank"
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :contacts
end

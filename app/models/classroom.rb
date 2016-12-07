class Classroom < ActiveRecord::Base
  attr_accessible :name, :user_ids, :student_ids 
  validates_presence_of :name, :message => "can't be blank"
  #validates_presence_of :Parent_Name, :message => "can't be blank"
  #validates_length_of :Phone_Number, :is => 10, :allow_blank => true, :message => "This phone number does not work"
  #validates_format_of :Email, :with =>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,:allow_blank => true, :message => 'format is not valid'
  #validates_inclusion_of :can_text, :in => [true, false]
  has_and_belongs_to_many :students
  has_and_belongs_to_many :users
 
end

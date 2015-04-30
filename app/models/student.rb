class Student < ActiveRecord::Base
  attr_accessible :Email, :Parent_Name, :Phone_Number, :Student_Name, :can_text, :classroom_name
  
  validates_presence_of :Student_Name, :message => "can't be blank"
  validates_presence_of :Parent_Name, :message => "can't be blank"
  validates_length_of :Phone_Number, :is => 10, :allow_blank => true, :message => 'must be 10 digits'
  validates_format_of :Email, :with =>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,:allow_blank => true, :message => 'format is not valid'
  belongs_to :text
  validates_inclusion_of :can_text, :in => [true, false]
end

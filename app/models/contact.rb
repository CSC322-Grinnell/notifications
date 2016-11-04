class Contact < ActiveRecord::Base
  attr_accessible :Name, :Phone_Number, :Email, :language, :can_text, :student_ids

  validates_presence_of :Name, :message => "can't be blank"
  validates_length_of :Phone_Number, :is => 10, :allow_blank => true, :message => "This phone number does not work"
  validates_format_of :Email, :with =>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,:allow_blank => true, :message => 'format is not valid'
  validates_inclusion_of :can_text, :in => [true, false]
  has_and_belongs_to_many :students
end


class Receipt < ActiveRecord::Base
  attr_accessible :message, :student

  belongs_to :message
  belongs_to :student

end

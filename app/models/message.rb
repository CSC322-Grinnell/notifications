class Message < ActiveRecord::Base
  attr_accessible :contents, :from
end

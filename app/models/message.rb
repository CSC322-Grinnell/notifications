class Message < ActiveRecord::Base
  attr_accessible :contents, :user
  has_many :student

  # Sends message to all recipients
  def send()
    receipts = Reciept.find_by_Message(self)
    receipts.each do |receipt|
      receipt.send()
    end
  end

  # Fetches message with given ID, or all messages if no parameters given.
  def self.fetch(id=nil)
    if id == nil
      return Message.all
    else
      return Message.find_by_id(id)
    end
  end
end

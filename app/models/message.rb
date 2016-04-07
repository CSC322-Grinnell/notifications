class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user

  # Sends message to all recipients
  def distribute()
    receipts = Receipt.find_all_by_message_id(self)
    receipts.each do |receipt|
      receipt.distribute()
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

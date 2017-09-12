class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user



  # Sends message to all recipients
  def distribute()
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    receipts = Receipt.find_all_by_message_id(self)
    receipts.each do |receipt|
      receipt.distribute(client)
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

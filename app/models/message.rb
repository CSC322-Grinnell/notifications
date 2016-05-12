class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user



  # Sends message to all recipients
  def distribute()
    account_sid = 'ACec51e723174bd5e3920e04c471fce279'
    auth_token = 'f79b115b533d4ba29f0bb0cc150cf0ab'
    #account_sid = 'SKa9949dade58a54485cb618099ed15bdb'
    #auth_token = 'XiG07bySRatOqGLd92E1Tf5MpyUHytDx'
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

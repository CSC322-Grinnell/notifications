class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user



  # Sends message to all recipients
  def distribute()

    #SID: SKa9949dade58a54485cb618099ed15bdb
    #Secret: XiG07bySRatOqGLd92E1Tf5MpyUHytDx
    account_sid = 'ACa9e2c26aa9c541562abfa60f22c17895'
    auth_token = '11d34276495a1f8acfb15958672aff55'
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

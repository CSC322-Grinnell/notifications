require 'rubygems'
require 'twilio-ruby'	
	# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACcb18011c64c77f7b2d26da071b440465'
auth_token = '95b84b123cf2ab58b04e9036b5448163'
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Jenny please?! I love you. I just love my cat more. <3",
:to => "+12532363623", # Replace with your phone number
:from => "+16412438092") # Replace with your Twilio number
puts message.sid

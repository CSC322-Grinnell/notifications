class UserController < ApplicationController
	require 'rubygems'
	#require 'twilio-ruby'

def show
   id = params[:id]
   @user = User.find(id)
   flash[:notice] = "In Show."
end

def index
   #@users = User.all
end

def create
  # @user = User.create!(params[:user])
  flash[:notice] = @message #"#{@user.firstName} was successfully created."
  ## redirect_to user_path
end
=begin
def new  #this should actually create a new user
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC2f8678b32a948acab39c0d426a966d1c'
auth_token = '2162328a31a28e73b4c229e116a4250d'
@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
:to => "+19018266352", # Replace with your phone number
:from => "+19015319781") # Replace with your Twilio number
puts message.sid

end
=end

def send_text

end
end

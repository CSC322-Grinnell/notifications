class TextController < ApplicationController
require 'rubygems'
require "twilio-ruby"

def index
end
    
def create
	num = params[:number].to_s.delete! '[\"]'
	mult_nums = num.split(', ')
	@invalid_num = Array.new

	mult_nums.each {|x| send_text(x)}

	if @invalid_num.length != 0
		flash[:notice] = "The number(s) #{@invalid_num} are invalid, others sent successfully"
	else
		flash[:notice] = "Message sent successfully."
	end
	render('index')
   # redirect_to :text => :create
end

def send_text(number)
	if number.match(/\b\d{10}\b/)
   		number = '+1' + number
     	#render :text => "Text to #{number} was succesfully created."
    	#flash[:notice] = "Text to #{number} was succesfully created."
    	account_sid = 'ACcb18011c64c77f7b2d26da071b440465'#'AC2f8678b32a948acab39c0d426a966d1c'
		auth_token = '95b84b123cf2ab58b04e9036b5448163'#'2162328a31a28e73b4c229e116a4250d'
		@client = Twilio::REST::Client.new account_sid, auth_token
		message = @client.account.messages.create(:body => params[:message],
		:to => number,
		:from => "+16412438092")#{}"+19015319781") # Replace with your Twilio number
		puts message.sid
	else
		@invalid_num << number
	end
end

end
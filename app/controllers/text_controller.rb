class TextController < ApplicationController
require 'rubygems'
require "twilio-ruby"
before_filter :require_user

def index
	@value = ''
end
    
def create
	@invalid_num = Array.new
	if params[:commit]== 'Send To All!'
		send_to_all()
	else 
	
	num = params[:number].to_s.delete! '[\"]'
	mult_nums = num.split(', ')
	num_texts = mult_nums.length
	
	mult_nums.each {|x| send_text(x)}
	end
	if @invalid_num.length != 0
		if @invalid_num[0] == "No Message"
			flash[:notice] = "Message Required"
			@value = num
		else
		inv_num = @invalid_num.to_s.delete! '\"'
		flash[:notice] = "The number(s) #{inv_num} are invalid, others sent successfully"
		inv_num.delete! '[]'
		@value = inv_num
		end
	else
		if num_texts > 1
		    flash[:notice] = "Messages sent successfully."
		else
		    flash[:notice] = "Message sent successfully."     
		end
	end
	render('index')
end

def send_to_all
	students = Student.all 
	students.each do |student|
		send_text(student.Phone_Number)
	end
end

def send_text(number)
	if params[:message] == [""]
		@invalid_num << "No Message"
	elsif number.match(/\b\d{10}\b/)
   		number = '+1' + number
     	account_sid = 'ACc3ff9be899397461c075ffcf9e70f35a'
		auth_token = '48f209948887f585f820760a89915194'
		@client = Twilio::REST::Client.new account_sid, auth_token
		message = @client.account.messages.create(:body => params[:message],
		:to => number,
		:from => "+16412434422")
		puts message.sid
	else
		@invalid_num << number
	end
end

end
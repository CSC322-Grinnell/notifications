class TextController < ApplicationController
require 'rubygems'
require "twilio-ruby"

    def index
     @number = params[:number]
     @message = params[:message]
    end
    
    def create
     @num = '+1' + params[:number].to_s()
     render :text => "Text to #{params[:number]} was succesfully created."

     account_sid = 'AC2f8678b32a948acab39c0d426a966d1c'
	 auth_token = '2162328a31a28e73b4c229e116a4250d'
	 @client = Twilio::REST::Client.new account_sid, auth_token
	 message = @client.account.messages.create(:body => params[:message],
	 :to => @num,
	 :from => "+19015319781") # Replace with your Twilio number
	 puts message.sid

    end
end
=begin
require "twilio-ruby"

  # your Twilio authentication credentials
  ACCOUNT_SID = 'AC2f8678b32a948acab39c0d426a966d1c'
  ACCOUNT_TOKEN = '2162328a31a28e73b4c229e116a4250d'

  # base URL of this application
  BASE_URL = "http://www.yourserver.com:3000/appointmentreminder"

  # Outgoing Caller ID you have previously validated with Twilio
  CALLER_ID = 'NNNNNNNNNN'

  def index
  end

  # Use the Twilio REST API to initiate an outgoing call
  def makecall
    if !params['number']
      redirect_to :action => '.', 'msg' => 'Invalid phone number'
      return
    end

    # parameters sent to Twilio REST API
    data = {
      :from => CALLER_ID,
      :to => params['number'],
      :url => BASE_URL + '/reminder',
    }

    begin
      client = Twilio::REST::Client.new(ACCOUNT_SID, ACCOUNT_TOKEN)
      client.account.calls.create data
    rescue StandardError => bang
      redirect_to :action => '.', 'msg' => "Error #{bang}"
      return
    end

    redirect_to :action => '', 'msg' => "Calling #{params['number']}..."
  end
  # @end snippet

  # @start snippet
  # TwiML response that reads the reminder to the caller and presents a
  # short menu: 1. repeat the msg, 2. directions, 3. goodbye
  def reminder
    @post_to = BASE_URL + '/directions'
    render :action => "reminder.xml.builder", :layout => false 
  end
  # @end snippet

  # @start snippet
  # TwiML response that inspects the caller's menu choice:
  # - says good bye and hangs up if the caller pressed 3
  # - repeats the menu if caller pressed any other digit besides 2 or 3
  # - says the directions if they pressed 2 and redirect back to menu
  def directions
    if params['Digits'] == '3'
      redirect_to :action => 'goodbye'
      return
    end

    if !params['Digits'] or params['Digits'] != '2'
      redirect_to :action => 'reminder'
      return
    end

    @redirect_to = BASE_URL + '/reminder'
    render :action => "directions.xml.builder", :layout => false 
  end
  # @end snippet

  # TwiML response saying with the goodbye message. Twilio will detect no
  # further commands after the Say and hangup
  def goodbye
    render :action => "goodbye.xml.builder", :layout => false 
  end

end
=end
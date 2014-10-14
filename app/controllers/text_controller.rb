class TextController < ApplicationController
  def index
   @number = params[:number]
   @message = params[:message]
  end
  
  def create
     @text = Text.create!(params[:text])

  flash[:notice] = "Text to #{@text.recipient} was successfully created."
  end
end

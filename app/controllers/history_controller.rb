class HistoryController < ApplicationController
  require 'message'
  before_filter :require_user

  @@messagesPerPage = 25

  def index
    @messages = Message.last(@@messagesPerPage).reverse
    render :index
  end
end

class HistoryController < ApplicationController
  before_filter :require_user

  @@messagesPerPage = 25

  def get
    messages = Messages.last(@@messagesPerPage).reverse
    erb :index, :messages => messages
  end
end

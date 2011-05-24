class MessagesController < ApplicationController
  #before_filter :require_user_handle
  def index
    @messages = Message.all
    render :json => @messages
  end

  def create
    message = Message.new(params)
   # message.name = current_user_handle
    message.save!
    head :ok
  end

  def update
    message = Message.find(params[:id])
   # message.name = current_user_handle
    message.update_attributes!(params)
    head :ok
  end
end
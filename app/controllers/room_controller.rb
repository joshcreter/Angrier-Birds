class RoomController < ApplicationController
  def index
  end

  def send_data
    render :juggernaut do |page|
    end
    render :nothing => true
  end

end

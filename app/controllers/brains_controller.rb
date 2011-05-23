class BrainsController < ApplicationController
  def start
    Delayed::Job.enqueue loopy()
  end

  def onetimeo
    Brain.onetime()
  end

  def onetime
    Juggernaut.publish("/observer",
    {:type => "message", :id => 1, :record => "whees"}
    )
    head :ok
  end
  #  handle_asynchronously :onetime

  def message
    Brain.send_later(:message)
    head :ok
  end

=begin
def loopy
while true do
Juggernaut.publish("/observer",
{:type => "looper", :record => "whees"}
)

sleep 5
end
=end
end

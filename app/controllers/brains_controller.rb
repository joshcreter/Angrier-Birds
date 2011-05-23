class BrainsController < ApplicationController
  def start
    REDIS.set("keep_alive", "true")
    head :ok
  end

  def stop
    REDIS.set("keep_alive", "false")
    head :ok
  end

  def loopy
    brain = BrainJob.new(:brain_id => 9, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
    Delayed::Job.enqueue brain
    head :ok
  end

=begin

def message
#    Brain.send_later(:message)
Brain.delay.message()
mybrain = Brain.new
mybrain.loopy
head :ok
end
=end
=begin
def loopyold
require 'fiber'
fibers = [Fiber.current]
fibers << Fiber.new do
count = 3
while count > 0
message = Message.new(:body => "yea #{Time.now.to_i}", :name => 7, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
message.save!
sleep 2
count -= 1
end

end

fibers.last.resume

head :ok
end

end
=end

=begin
require "em-synchrony"
EventMachine.synchrony do

#     redis = EventMachine::Redis.new(:host => 'juggernaut.angrier-birds.com')
keep_alive = true
count = 3
while count > 0
message = Message.new(:body => "yea #{Time.now.to_i}", :name => 7, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
message.save!

EventMachine::Synchrony.sleep(5)
#sleep 5
#EM::Synchrony.sleep(2)
#keep_alive = regis.amapped_mget("keep_alive")
count -= 1
end

# EM.stop
=end

end

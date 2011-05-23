class Brain
=begin
  
  def self.message
    message = Message.new(:body => "wha!", :name => 6, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
    message.save!
  end

  def loopy
    count = 3
    while count > 0
      message = Message.new(:body => "yea", :name => 7, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
      message.save!

      message2 = Message.new(:body => "ne", :name => 7, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
      message2.save!
      #keep_alive = regis.amapped_mget("keep_alive")
      count -= 1
    end

  end

  def self.perform
    message = Message.new(:body => "yea #{Time.now.to_i}", :name => 7, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
    message.save!
  end
=end
=begin
EM.synchrony do

redis = EventMachine::Redis.new(:host => 'juggernaut.angrier-birds.com')
keep_alive = true

#        EM::Synchrony.sleep(5)

EventMachine.stop
end
=end
end
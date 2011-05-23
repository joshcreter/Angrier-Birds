class BrainJob < Struct.new(:channel_id, :brain_id)
  def keep_alive?
    if REDIS.get("keep_alive") == "true"
    return 1
    else
    return 0
    end
  end

  def keep_working?
    if REDIS.get("keep_working") == "true"
    return 1
    else
    return 0
    end
  end

  def make_alive!
    REDIS.set("keep_alive", "true")
  end

  def make_dead!
    REDIS.set("keep_alive", "false")
  end

  def start_working!
    REDIS.set("keep_working", "true")
  end

  def stop_working!
    REDIS.set("keep_working", "false")
  end

  def perform
    loopcount = 0

    make_alive!
    start_working!

    while keep_alive?

      while keep_alive? && keep_working?
        message_body = "#{count} #{REDIS.get("keepalive")} #{Time.now.to_i}"

        message = Message.new(:body => message_body, :name => brain_id, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
        message.save!

        sleep(3)

        loopcount += 1
      end
    end
  end
=begin
EM.synchrony do

redis = EventMachine::Redis.new(:host => 'juggernaut.angrier-birds.com')
keep_alive = true

#        EM::Synchrony.sleep(5)

EventMachine.stop
end
=end
end
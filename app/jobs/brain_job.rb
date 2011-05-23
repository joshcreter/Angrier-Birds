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
      message_body = "#{Time.now.to_i} - Loop: #{count} - [insert wit here]"

      message = Message.new(:body => message_body, :name => brain_id, :channel_id => "261419F9-67DC-4CA6-A408-A648E09211F0")
      message.save!

      sleep(5)

      loopcount += 1
    end
  end
end
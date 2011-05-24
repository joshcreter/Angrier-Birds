class BrainJob < Struct.new(:brain_id, :channel_id)
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
    loopcount = 3
    make_alive!
    start_working!

    #    while keep_alive?
    while loopcount > 0
      message_body = "#{Time.now} - [witty saying goes in here] - Countdown: #{loopcount}"

      message = Message.new(:body => message_body, :name => brain_id, :channel_id => channel_id)
      message.save!

      sleep(5)

      loopcount -= 1
    end
  end
end
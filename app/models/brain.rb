class Brain < ActiveRecord::Base
  def self.message
    message = Message.new(:body => "wha!", :name => 6, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
    message.save!
  end

  def self.looper

    keep_alive = true

    while keep_alive

      :message

    end
  end

end
class BrainsController < ApplicationController
  def start
    REDIS.set("keep_alive", "true")
    redirect_to :back
  end

  def stop
    REDIS.set("keep_alive", "false")
    redirect_to :back
  end

  def loopy
    brain = BrainJob.new(:brain_id => 9999, :channel_id => "F900A25F-5C39-42FF-8CBD-AA7E80F8F94E")
    Delayed::Job.enqueue brain
    redirect_to :back
  end

end

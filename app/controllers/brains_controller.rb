class BrainsController < ApplicationController

  @@channel_id = "2819176B-EEBE-4C70-9BFE-1CCA04A31267"
  def start
    REDIS.set("keep_alive", "true")
    redirect_to :back
  end

  def stop
    REDIS.set("keep_alive", "false")
    redirect_to :back
  end

  def loopy
    brain = BrainJob.new("loopy", @@channel_id)
    Delayed::Job.enqueue brain
    redirect_to :back
  end

  def onetime
    brain = BrainJob.new("birdbrain", @@channel_id)
    brain.perform
    redirect_to :back
  end

end

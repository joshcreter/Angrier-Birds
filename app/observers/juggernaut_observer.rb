class JuggernautObserver < ActiveRecord::Observer
  observe :message, :channel
  def after_create(rec)
    publish(:create, rec)
  end

  def after_update(rec)
    publish(:update, rec)
  end

  def after_destroy(rec)
    publish(:destroy, rec)
  end

  #    :redis_options => {:host => 'juggernaut.angrier-birds.com', :port => 6379}

  protected

  def publish(type, rec)
    # Rails.logger.debug   Juggernaut.redis_options
    #    {:host => 'juggernaut.angrier-birds.com', :port => 6379}

    Juggernaut.publish("/observer",
    {:type => type, :id => rec.id,
      :klass => rec.class.name, :record => rec}
    )
  end
end


class UpdateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "update_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    ActionCable.server.broadcast 'create_channel', data
  end
end

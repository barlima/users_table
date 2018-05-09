class DestroyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "destroy_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def destroy(data)
    User.find(data['id']).destroy
    ActionCable.server.broadcast 'create_channel', data
  end
end

class CreateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "create_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    @user = User.create!(
      first_name: data['first_name'],
      last_name: data['last_name'],
      email: data['email']
    )
    ActionCable.server.broadcast 'create_channel', data.merge({id: @user.id.to_s})
  end
end

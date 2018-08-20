class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_channel:#{current_user.id}"
  end

  def unsubscribed
  end
end

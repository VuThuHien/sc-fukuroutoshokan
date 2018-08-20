class NotificationJob < ApplicationJob
  include ActionView::Helpers::UrlHelper

  queue_as :default

  def perform obj
    routes = Rails.application.routes.url_helpers
    obj_class = obj.class.name
    obj_id = obj.id
    user_id = obj.has_attribute?(:user_id) ? obj.user_id : obj.to_id
    object = obj

    case obj_class
      when Comment.name
        review = obj.review
        receiver_id = review.user_id
        receiver = User.find_by id: receiver_id
        counter = receiver.not_read_notifications_count
        sender = obj.user.name
        message = I18n.t "notifications.job.has_comment"
        review_title = review.title
        review_path = routes.review_path(review)
        url = sender + message + review_title + '<br>'
        link = url.html_safe

        unless receiver_id == obj.user.id
          notification = Notification.create user_id: receiver_id,
            content: "#{sender} #{message} #{review_title}",
            link_to: review_path,
            target: obj_class,
            target_id: obj_id,
            isRead: false
          ActionCable.server.broadcast "notification_channel:#{receiver_id}",
            counter: counter + 1,
            content: "#{link_to link, review_path, "data-turbolinks": false}",
            id: notification.id
        end

      when Like.name
        review = obj.review
        receiver_id = review.user_id
        receiver = User.find_by id: receiver_id
        counter = receiver.not_read_notifications_count
        sender = obj.user.name
        message = I18n.t "notifications.job.has_like"
        review_title = review.title
        review_path = routes.review_path(review)
        url = sender + message + review_title + '<br>'
        link = url.html_safe

        unless receiver_id == obj.user.id
          notification = Notification.create user_id: receiver_id,
            content: "#{sender} #{message} #{review_title}",
            link_to: review_path,
            target: obj_class,
            target_id: obj_id,
            isRead: false
          ActionCable.server.broadcast "notification_channel:#{receiver_id}",
            counter: counter + 1,
            content: "#{link_to link, review_path, "data-turbolinks": false}",
            id: notification.id
        end
      else
        return nil
    end
  end
end

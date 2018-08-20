class NotificationsController < ApplicationController
  before_action :find_notification, only: :update

  def index
    @notifications = current_user.notifications.order(id: :desc)
      .page(params[:page]).per 10
  end

  def update
    @notify.update_attributes isRead: true
    render json: {unread: unread_notifications_count}
  end

  private
  def find_notification
    @notify = current_user.notifications.find_by id: params[:id]
  end

  def unread_notifications_count
    current_user.notifications.where(isRead: false).size
  end
end

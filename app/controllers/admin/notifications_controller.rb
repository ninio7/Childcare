class Admin::NotificationsController < ApplicationController
  def index
    @notifications = current_admin.notifications.where(send_by_admin: true).order(created_at: :desc).page(params[:page]).per(10)
    # @notifications = current_admin.notification.all
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end



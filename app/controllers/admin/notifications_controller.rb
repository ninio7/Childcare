class Admin::NotificationsController < ApplicationController
  def index
# @absent = Absent.find(params[:id])
    # @contact = Contact.where(params[:id])
    @notifications = Notification.where(send_by_admin: true).order(created_at: :desc).page(params[:page]).per(10)
    # @notifications = current_admin.notification.all
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end



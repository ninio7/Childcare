class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @notifications = Notification.where(send_by_admin: true).order(created_at: :desc).page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end



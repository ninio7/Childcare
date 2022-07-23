class Public::NotificationsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @contacts = Contact.published.page(params[:page]).per(10).reverse_order
    @notifications = current_customer.notifications.where(send_by_admin: false).page(params[:page]).reverse_order
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end

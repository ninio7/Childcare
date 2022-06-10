class Public::NotificationsController < ApplicationController
  def index
    @customer = current_customer
    # @contacts = Contact.published.page(params[:page]).reverse_order
    @contacts = current_customer.contacts.page(params[:page])
    @notifications = current_customer.notifications.where(send_by_admin: false).page(params[:page])
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end

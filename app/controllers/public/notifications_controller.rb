class Public::NotificationsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @contacts = Contact.published.order(created_at: :desc).page(params[:page]).per(10)
    @contact_contacts = ContactContact.where(customer_id: current_customer.id)
    @notifications = current_customer.notifications.where(send_by_admin: false).page(params[:page])
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end

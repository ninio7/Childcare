class Public::NotificationsController < ApplicationController
  def index
    # @contacts = current_customer.contacts.page(params[:page])
    # @absent = Absent.find(params[:customer_id])
    @contacts = Contact.published.page(params[:page]).reverse_order
    # @contacts = @contacts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @notifications = current_customer.notifications.where(send_by_admin: false).page(params[:page])
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end

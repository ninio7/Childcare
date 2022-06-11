module Admin::NotificationsHelper
 def unchecked_notifications
    @notifications = Notification.where(checked: false, send_by_admin: true)
 end

 def customer_unchecked_notifications
    @notifications = Notification.where(checked: false, send_by_admin: false)
 end

end
class News < ApplicationRecord
  belongs_to :admin
  belongs_to :group
  has_many :notifications, dependent: :destroy

  # 管理者がお知らせを作った時
  def create_notification_by_admin(current_admin, target_customer)
      notification = Notification.new(
        customer_id: target_customer.id,
        admin_id: current_admin.id,
        news_id: self.id,
        send_by_admin: false # つまり保護者へ通知
      )
    notification.save if notification.valid?
  end
end

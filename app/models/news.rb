class News < ApplicationRecord
  belongs_to :admin
  has_many :news_groups, dependent: :destroy
  has_many :groups, through: :news_groups
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


  validates :title, presence: true, length: {maximum: 20}
  validates :body, presence: true
  validates :started_on, presence: true
  validates :finished_on, presence: true

end

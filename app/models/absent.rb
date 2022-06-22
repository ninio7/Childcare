class Absent < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :child
  has_many :notifications, dependent: :destroy


  # 保護者が欠席を作った時
  def create_notification_by_customer(current_customer, target_admin)
    notification = Notification.new(
      customer_id: current_customer.id,
      absent_id: self.id,
      admin_id: target_admin.id,
      send_by_admin: true # つまり管理者へ通知
    )
     notification.save if notification.valid?
  end

 # 種別の設定
  enum kind:{
    absence:0,
    lateness:1,
  }

  validates :kind, presence: true
  
end




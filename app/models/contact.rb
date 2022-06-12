class Contact < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :admin, optional: true
  belongs_to :child
  has_many :notifications, dependent: :destroy

  # 保護者が連絡を作った時
  def create_notification_by_customer(current_customer, target_admin)
    notification = Notification.new(
      customer_id: current_customer.id,
      contact_id: self.id,
      admin_id: target_admin.id,
      send_by_admin: true # つまり管理者へ通知
    )
     notification.save if notification.valid?
  end

  # 管理者が連絡を作った時
  def create_notification_by_admin(current_admin, target_customer)
      notification = Notification.new(
        customer_id: target_customer.id,
        admin_id: current_admin.id,
        contact_id: self.id,
        send_by_admin: false # つまり保護者へ通知
      )
     notification.save if notification.valid?
  end




  # 主食量の設定
  enum staple_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }
  # 主菜量の設定
   enum main_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }, _prefix: true

  # 副菜量の設定
   enum side_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }, _prefix: true

   # デザート量の設定
  enum dessert_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }, _prefix: true

   # 夕食量の設定
  enum dinner_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }, _prefix: true

    # 朝食量の設定
  enum breakfast_quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }, _prefix: true

   # 機嫌の設定
  enum humor:{
    good:0,
    usually:1,
    bad:2,
  }

  # 排便量の設定
  enum defecation:{
    didnot:0,
    normal:1,
    soft:2,
    diarrhea:3,
    hard:4,
  }

  # 睡眠度の設定
  enum sleep_degree:{
    deep:0,
    shallow:1,
  }

  # プールの設定
  enum pool:{
    ok:0,
    off:1,
  }

   # 天気の設定
  enum weather:{
    sunny:0,
    cloudy:1,
    rain:2,
  }

    # 下書きステータスの設定
  enum status:{
    published:0,
    draft:1,
  }
end

def day
  Date.today.wday
end
def days
 ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
end


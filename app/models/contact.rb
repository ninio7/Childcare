class Contact < ApplicationRecord
  has_many_attached :images
  belongs_to :customer
  belongs_to :admin, optional: true
  belongs_to :child
  has_many :notifications, dependent: :destroy

  scope :created_today, -> {published.where("created_at >= ? AND admin_id IS NOT NULL", Time.zone.now.beginning_of_day)}
  scope :created_today_draft, -> {draft.where("created_at >= ? AND admin_id IS NOT NULL", Time.zone.now.beginning_of_day)}

  scope :created_at_from, -> (from) { where('? <= created_at', from) if from.present? }
  scope :created_at_to, -> (to) { where('created_at <= ?', to) if to.present? }

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


  # I18nを使用しない場合↓
  # def weeks
  #   ["日","月","火","水","木","金","土"]
  # end

  # def week
  #   weeks[Date.today.wday]
  # end

  # def date
  #   Date.current.strftime("%Y年%m月%d日 (#{week})")
  # end

end


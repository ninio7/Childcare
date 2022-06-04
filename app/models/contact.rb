class Contact < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :admin
  belongs_to :child
  # 昼食量の設定
  enum quantity:{
    completed:0,
    little:1,
    half:2,
    largely:3,
  }

   # 機嫌の設定
  enum humor:{
    good:0,
    usually:1,
    bad:2,
  }

  # 排便量の設定
  enum defecation:{
    normal:0,
    soft:1,
    diarrhea:2,
    hard:3,
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


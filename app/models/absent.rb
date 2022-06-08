class Absent < ApplicationRecord
    # 種別の設定
  enum kind:{
    absence:0,
    lateness:1,
  }
  belongs_to :customer, optional: true
  belongs_to :child
  belongs_to :admin, optional: true

end

def day
  Date.today.wday
end

def days
 ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
end

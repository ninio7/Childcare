class AbsenceNotification < ApplicationRecord
   # 種別の設定
  enum type:{
    absence:0,
    lateness:1,
  }
end

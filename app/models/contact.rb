class Contact < ApplicationRecord
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
    usually:0,
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
    no:1,
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

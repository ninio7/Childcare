class WeeklyPlan < ApplicationRecord
  belongs_to :admin
  belongs_to :group

  def day
    Date.today.strftime("%Y年%m月")
  end
end

class PersonalPlan < ApplicationRecord
  belongs_to :admin
  belongs_to :child
  belongs_to :group

  def age
    (created_at.strftime("%Y%m%d").to_i - child.birthday.strftime("%Y%m%d").to_i) / 10000
  end

  def months
   ((created_at.strftime("%Y%m%d").to_i - child.birthday.strftime("%Y%m%d").to_i) /100 ).to_s.split("")[-1]
  end

end

class Accident < ApplicationRecord
  belongs_to :admin
  belongs_to :group

  def week
    %w(日 月 火 水 木 金 土)[started_on.wday]
  end
  
end

class Notification < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :absent, optional: true
  belongs_to :customer, optional: true
  belongs_to :admin, optional: true
end

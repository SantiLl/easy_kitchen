class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  validates :date, presence: true
end

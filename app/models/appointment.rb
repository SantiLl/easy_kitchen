class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_many :reviews, dependent: :destroy
  validates :date, presence: true
end

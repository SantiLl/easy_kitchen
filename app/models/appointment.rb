class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_many :reviews, dependent: :destroy
  validates :date, presence: true
  def client
    self.review.appointment.user
  end
end

class Review < ApplicationRecord
  belongs_to :appointment
  validates :content, presence: true
  def user
    appointment.user
  end
end

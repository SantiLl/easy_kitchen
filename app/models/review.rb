class Review < ApplicationRecord
  belongs_to :appointment
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  def user
    appointment.user
  end

  def author
    user.name.nil? ? user.email : user.name
  end
end

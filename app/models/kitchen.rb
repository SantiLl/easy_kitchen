class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :appointments
  validates :address, presence: true
end

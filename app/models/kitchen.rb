class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :reviews, through: :appointments
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

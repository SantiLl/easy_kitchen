class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :reviews, through: :appointments
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end

class Kitchen < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :appointments
end

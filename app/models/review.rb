class Review < ApplicationRecord
  belongs_to :appointments
  validates :content, presence: true
end

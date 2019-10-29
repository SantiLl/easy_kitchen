class Review < ApplicationRecord
  belongs_to :appointment
  validates :content, presence: true
end

class Review < ApplicationRecord
  belongs_to :kitchen
  validates :content, presence: true
end

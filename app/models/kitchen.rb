class Kitchen < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :reviews, through: :appointments
  validates :address, presence: true
  validates :photo, presence: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  pg_search_scope :search,
    against: [:name, :address, :price, :description],
    using: {
      tsearch: { prefix: true }
    }

  def average_rating
    reviews.average(:rating).to_f.round(1)
  end
end

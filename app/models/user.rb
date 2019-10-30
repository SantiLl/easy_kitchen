class User < ApplicationRecord
  has_many :kithchens
  has_many :appointments
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar
    photo.filename.nil? ? "http://romanroadtrust.co.uk/wp-content/uploads/2018/01/profile-icon-png-898.png" : "https://res.cloudinary.com/dd28ghazj/#{photo.identifier}"
  end
end

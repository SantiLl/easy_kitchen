class User < ApplicationRecord
  has_many :kithchens
  has_many :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   def avatar
    photo.nil? ? "http://romanroadtrust.co.uk/wp-content/uploads/2018/01/profile-icon-png-898.png" : photo
  end
  mount_uploader :photo, PhotoUploader
end

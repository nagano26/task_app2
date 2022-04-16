class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(room)
    self.favorites.exists?(room_id: room.id)
  end
  
  with_options presence: true do
    validates :username
    validates :email
    validates :profile
  end
end

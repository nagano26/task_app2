class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy
    has_many :favorites, dependent: :destroy
    attachment :room_image

    def self.search(keyword)
        where(["room_name like? OR room_body like?", "%#{keyword}%", "%#{keyword}%"])
    end

    def self.search(area)
        where(['address LIKE ?', "%#{area}%"]) 
    end 

    with_options presence: true do
        validates :room_name
        validates :room_body
        validates :room_price
        validates :address
    end
    validates :room_price, {numericality: true}
end

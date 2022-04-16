class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :user
    
    with_options presence: true do
        validates :start_at
        validates :end_at
        validates :number_people
    end

    validate :start_end_check 
    validate :date_before_start 
    
    def start_end_check
        errors.add(:end_at, "は開始日以降の日を登録してください") unless
        start_at == nil or end_at == nil or start_at < end_at
    end

    def date_before_start
        errors.add(:start_at, "は今日以降のものを選択してください") if  start_at != nil and end_at != nil and start_at < Date.today
    end

    def total_day
        (self.end_at - self.start_at).to_i
    end

    def total_price
        self.total_day.to_i * self.number_people.to_i * self.room.room_price
    end
end

class Room < ActiveRecord::Base

  belongs_to :hotel

  has_many :bookings

  def check_dates
    dates = []

    bookings.where("date_end > ?", Time.now).each do |range|
      (range.date_start..range.date_end).each {|date| dates << date }
    end
    dates
  end

end

class Room < ActiveRecord::Base

  belongs_to :hotel

  has_many :bookings


  def booked_for(date)
    #TODO
  end

end

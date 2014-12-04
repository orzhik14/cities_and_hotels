class AjaxController < ApplicationController
  def get_hotels
    city = City.find(params[:city_id])
    @hotels = city.hotels
  end

  def get_rooms
    # TODO
  end
end

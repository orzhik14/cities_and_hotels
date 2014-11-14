class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # Room:
  # id, hotel_id


  # Booking
  # id, room_id, date_start, date_end

  def booking

    @room = Room.find(params[:room_id])

    return if params[:date_start].nil? || params[:date_end].nil?

    date_start = Date.strptime(params[:date_start], '%d.%m.%Y')
    date_end   = Date.strptime(params[:date_end],   '%d.%m.%Y')


    while day <= date_end
      @days = @room.booked_for(day)
    end























#    @bookings = @room.bookings.where('date_start > ?', Time.now)

#    dates = []

#    @bookings.all.each { |b| dates << [b.date_start, b.date_end] }

#
#  [
#    [ Sat, 15 Nov 2014, Tue, 25 Nov 2014],
#    [ Thu, 27 Nov 2014, Sun, 30 Nov 2014]
#  ]



#    day = date_start

  #   @result = true

  #   while day < date_end do
  #     break unless @result
  #     dates.each do |range|
  #       range_start = range[0].to_date
  #       range_end   = range[1].to_date
  #       while range_start <= range_end do
  #         @result = false if day == range_start.to_date
  #         range_start += 1.days
  #       end
  #     end
  #     day += 1.days
  #   end
  # end

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_name, :date_start, :date_end)
    end
end

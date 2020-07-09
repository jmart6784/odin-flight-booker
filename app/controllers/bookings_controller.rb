class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    @passenger = Passenger.find(@booking.passenger_id)
  end

  def new
    @booking = Booking.new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(name: params[:passengers][:name], email: params[:passengers][:email])

    if @passenger.save
      @booking = Booking.new(flight_id: params[:flight_id].to_i)
      @booking.flight_id = params[:flight_id].to_i
      @booking.passenger_id = @passenger.id

      if @booking.save
        @passenger.booking_id = @booking.id
        @passenger.save
        flash.notice = "Successfully created a booking!"
        redirect_to @booking
      else
        flash.now[:danger] = "Can't create this Booking"
        render "new"
      end
    else
      flash.now[:danger] = "Can't create this Booking"
      render "new"
    end
  end
end
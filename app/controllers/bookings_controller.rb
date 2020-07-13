class BookingsController < ApplicationController
  def index
    @bookings = Booking.all.paginate(page: params[:page], per_page: 12)
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  def new
    @booking = Booking.new
    @passenger = Passenger.new
  end

  def create
    @booking = Booking.new(flight_id: params[:flight_id].to_i)

    case params[:num_passengers].to_i
    when 1
      @passenger1 = Passenger.new(
        name: passenger_params[:pass1][:name], 
        email: passenger_params[:pass1][:email]
      )

      if @passenger1.save
        @booking.passenger_id = @passenger1.id
        @booking.save
        @passenger1.booking_id = @booking.id
        @passenger1.save

        flash.notice = "Successfully created a booking!"
        redirect_to @booking
      else
        flash[:danger] = "Passenger information invalid"
        render "new"
      end
    when 2
      @passenger1 = Passenger.new(
        name: passenger_params[:pass1][:name], 
        email: passenger_params[:pass1][:email]
      )
  
      @passenger2 = Passenger.new(
        name: passenger_params[:pass2][:name], 
        email: passenger_params[:pass2][:email]
      )

      if @passenger1.save && @passenger2.save
        @booking.passenger_id = @passenger1.id
        @booking.save
        @passenger1.booking_id = @booking.id
        @passenger1.save

        @booking.passenger_id = @passenger2.id
        @booking.save
        @passenger2.booking_id = @booking.id
        @passenger2.save

        flash.notice = "Successfully created a booking!"
        redirect_to @booking
      else
        flash[:danger] = "Passenger information invalid"
        render "new"
      end
    when 3
      @passenger1 = Passenger.new(
        name: passenger_params[:pass1][:name], 
        email: passenger_params[:pass1][:email]
      )
  
      @passenger2 = Passenger.new(
        name: passenger_params[:pass2][:name], 
        email: passenger_params[:pass2][:email]
      )
  
      @passenger3 = Passenger.new(
        name: passenger_params[:pass3][:name], 
        email: passenger_params[:pass3][:email]
      )

      if @passenger1.save && @passenger2.save && @passenger3.save
        @booking.passenger_id = @passenger1.id
        @booking.save
        @passenger1.booking_id = @booking.id
        @passenger1.save

        @booking.passenger_id = @passenger2.id
        @booking.save
        @passenger2.booking_id = @booking.id
        @passenger2.save

        @booking.passenger_id = @passenger3.id
        @booking.save
        @passenger3.booking_id = @booking.id
        @passenger3.save

        flash.notice = "Successfully created a booking!"
        redirect_to @booking
      else
        flash[:danger] = "Passenger information invalid"
        render "new"
      end
    when 4
      @passenger1 = Passenger.new(
        name: passenger_params[:pass1][:name], 
        email: passenger_params[:pass1][:email]
      )
  
      @passenger2 = Passenger.new(
        name: passenger_params[:pass2][:name], 
        email: passenger_params[:pass2][:email]
      )
  
      @passenger3 = Passenger.new(
        name: passenger_params[:pass3][:name], 
        email: passenger_params[:pass3][:email]
      )
  
      @passenger4 = Passenger.new(
        name: passenger_params[:pass4][:name], 
        email: passenger_params[:pass4][:email]
      )

      if @passenger1.save && @passenger2.save && @passenger3.save && @passenger4.save
        @booking.passenger_id = @passenger1.id
        @booking.save
        @passenger1.booking_id = @booking.id
        @passenger1.save

        @booking.passenger_id = @passenger2.id
        @booking.save
        @passenger2.booking_id = @booking.id
        @passenger2.save

        @booking.passenger_id = @passenger3.id
        @booking.save
        @passenger3.booking_id = @booking.id
        @passenger3.save

        @booking.passenger_id = @passenger4.id
        @booking.save
        @passenger4.booking_id = @booking.id
        @passenger4.save

        flash.notice = "Successfully created a booking!"
        redirect_to @booking
      else
        flash[:danger] = "Passenger information invalid"
        render "new"
      end
    end
  end

  private

  def passenger_params
    params.require(:passengers).permit(
      pass1: [:name, :email], 
      pass2: [:name, :email], 
      pass3: [:name, :email], 
      pass4: [:name, :email]
    )
  end
end
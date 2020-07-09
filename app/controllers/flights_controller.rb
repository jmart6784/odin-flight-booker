class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order("start_date ASC").paginate(page: params[:page], per_page: 50)

    @valid_dates ||= Flight.all.order(:start_date).distinct.pluck(:start_date).map! {|date| [date.strftime("%B %d %Y"), date] }

    @airports = Airport.all.map{ |airport| [airport.code, airport.id] }

    if params[:search_flights]
      @search_results = Flight.where(
        start_date: params[:search_flights][:start_date],
        departure_id: params[:search_flights][:departure_id],
        arrival_id: params[:search_flights][:arrival_id]
      ).paginate(page: params[:page], per_page: 10)

      if @search_results.count == 0
        @search_nil = true
      else
        @search_nil = false
      end
    end

    @passengers = [1, 2, 3, 4]
  end
end
class TripsController < ApplicationController
  skip_before_action :authenticate_user!
  #Richad a code trop vite ce controller!
  def index
    @trips = Trip.all
  end

  # def show
  #   @trip = Trip.find(params[:id])
  # end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_paths
    else
      render :new
    end

  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title)
  end
end

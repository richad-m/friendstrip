class TripsController < ApplicationController
  skip_before_action :authenticate_user!
  #Richad a code trop vite ce controller!
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end

  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title, :description)
  end
end

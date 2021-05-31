class TripsController < ApplicationController
  skip_before_action :authenticate_user!
  #Richad a code trop vite ce controller!
  def index
    @trips_invitations = current_user.invites.select { |invite| invite.accepted?}.map { |invite| invite.trip}
    @all_user_trips = current_user.trips + @trips_invitations
    @trips = @all_user_trips.uniq.sort {|a,b| b.start_date <=> a.start_date}
    # @trips = Trip.all.order('start_date DESC')
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_duration = (@trip.end_date - @trip.start_date).to_i
    @invite = Invite.new
    @proposition = Proposition.new
    @vote = Vote.new
    # @pending_propositions = Trip.propositions.where(status: nil)
    # @validation_propositions = Trip.propositions.where(status: validated)
    #Collection of email in DB
    @emails = User.all.map {|user| user.email}
    @markers = @trip.propositions.map do |proposition|
      {
        lat: proposition.latitude,
        lng: proposition.longitude,
        info_window: render_to_string(partial: "info_window", locals: { proposition: proposition }),
        marker_icon: "<i class='fas #{Proposition::ICONS[proposition.category]}'</i>",
        marker_color: "text-color-#{proposition.category}"
      }
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      flash.notice = "#{@trip.title} has been created"
      redirect_to trip_path(@trip.id)
    else
      render :new
    end

  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title, :description, :destination)
  end
end

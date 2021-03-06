class TripsController < ApplicationController
  skip_before_action :authenticate_user!
  #Richad a code trop vite ce controller!
  def index
    #Retrieving all trips using pundit policy
    @all_trips = policy_scope(Trip)
    # TO DELETE? Retrieving all trips invitations from the user
    @trips_invitations = current_user.invites.select { |invite| invite.accepted?}.map { |invite| invite.trip}
    #Retrieving all trips owned by the user or where he has accepted an invite
    @all_user_trips = @all_trips.select {|trip| trip.user_id == current_user.id || !trip.invites.select {|invite| invite.accepted? && invite.user_id == current_user.id}.empty?}
    #  OLD CODE : @all_user_trips = current_user.trips + @trips_invitations

    @trips = @all_user_trips.uniq.sort {|a,b| b.start_date <=> a.start_date}
    #  OLD CODE : @trips = Trip.all.order('start_date DESC')
    # raise
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_duration = (@trip.end_date - @trip.start_date).to_i
    @invite = Invite.new
    @proposition = Proposition.new
    @vote = Vote.new
    @propositions = @trip.propositions
    authorize @trip
    # @pending_propositions = Trip.propositions.where(status: nil)
    # @validation_propositions = Trip.propositions.where(status: validated)
    #Collection of email in DB
    @emails = User.all.map {|user| user.email}

    #Setting markers for all propositions
    @markers = @trip.propositions.select {|prop| prop.status != "validated"}.map do |proposition|
      {
        lat: proposition.latitude,
        lng: proposition.longitude,
        info_window: render_to_string(partial: "info_window", locals: { proposition: proposition }),
        marker_icon: "<i class='fas #{Proposition::ICONS[proposition.category]}'</i>",
        marker_color: "text-color-#{proposition.category}"
      }
    end
    # @validated_prop = @propositions.select {|prop| prop.status == "validated"}
    @validated_prop = @propositions.where(status: "validated").order('start_date ASC')
    #Setting markers for validated propositions
    @validated_markers = @validated_prop.map do |proposition|
      {
        lat: proposition.latitude,
        lng: proposition.longitude,
        info_window: render_to_string(partial: "info_window", locals: { proposition: proposition }),
        marker_icon: "<i class='fas #{Proposition::ICONS[proposition.category]}'></i>",
        marker_color: "text-color-#{proposition.category}"
      }
    end
    if @validated_prop.count > 1
      points = @validated_prop.map { |prop| prop.slice(:latitude, :longitude)}
      # if @validated_prop.count > 1
      mapbox_reponse = Mapbox::Directions.directions(points, "driving", {geometries: "geojson"})
      @steps = mapbox_reponse&.first&.dig("routes")&.first&.dig("geometry","coordinates")
      # end
    end
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    authorize @trip
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

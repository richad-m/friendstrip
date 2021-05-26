class PropositionsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @propositions = Proposition.all
    @markers = @propositions.geocoded.map do |proposition|
      {
        lat: proposition.latitude,
        lng: proposition.longitude,
        info_window: render_to_string(partial: "info_window", locals: { proposition: proposition })
      }
    end
  end

   def new
     @proposition = Proposition.new
   end

   def create
     @proposition = Proposition.new(proposition_params)
     @proposition.user_id = current_user.id
     @trip = Trip.find(params[:trip_id])
     @proposition.trip_id = @trip.id
     if @proposition.save
       redirect_to trip_path(@trip.id)
     else
       render :new
     end
   end

  #  def validate
  #    @proposition = Proposition.find(params[:id])
  #    @proposition.status = "validated"
  #    @proposition.save
  #  end

  #  def dismiss
  #    @proposition = Proposition.find(params[:id])
  #    @proposition.status = "dismissed"
  #    @proposition.save
  #  end

   private

   def proposition_params
     params.require(:proposition).permit(:trip_id, :user_id, :category, :start_date, :end_date, :due_date, :title, :description, :url)
   end

end

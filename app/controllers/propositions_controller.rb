class PropositionsController < ApplicationController

  def show
    @proposition = Proposition.find(params[:trip_id])
  end

   def new
     @proposition = Proposition.new
     @trip = Trip.find(params[:trip_id])
   end

  def create
    @proposition = Proposition.new(proposition_params)
    @proposition.user_id = current_user.id
    @trip = Trip.find(params[:trip_id])
    @proposition.trip_id = @trip.id
    if @proposition.save
      flash.notice = "#{@proposition.title} has been added to pending propositions"
      redirect_to trip_path(@trip.id, anchor: "prop-#{@proposition.id}")
    else
      render :new
    end
  end

  def validate
    @proposition = Proposition.find(params[:id])
    @proposition.status = "validated"
    if @proposition.save
    flash.notice = "#{@proposition.title} has been moved to validated propositions."
    redirect_to trip_path(@proposition.trip, anchor: "prop-#{@proposition.id}")
    end
  end

  def destroy
    @proposition = Proposition.find(params[:trip_id])
    @proposition.destroy
    flash.notice = "#{@proposition.title} has been removed."
    redirect_to trip_path(@proposition.trip)
  end

  #  def markers(prop)
  #   @trip = Trip.find(params[:id])
  #   @propositions = @trip.propositions
  #   @pending_prop = @propositions.select {|prop| prop.status =! "validated"}
  #   @validated_prop = @propositions.select {|prop| prop.status == "validated"}
  #   if prop = "pending"
  #     @markers = @pending_propositions.geocoded.map do |proposition|
  #       {
  #         lat: proposition.latitude,
  #         lng: proposition.longitude,
  #         info_window: render_to_string(partial: "info_window", locals: { proposition: proposition }),
  #         marker_icon: '<i class="fas <%=iconecategory%>"></i>',
  #         marker_color: "text-color-#{proposition.category}"
  #       }
  #     end
  #   else
  #     @markers = @validated_prop.geocoded.map do |proposition|
  #       {
  #         lat: proposition.latitude,
  #         lng: proposition.longitude,
  #         info_window: render_to_string(partial: "info_window", locals: { proposition: proposition }),
  #         marker_icon: '<i class="fas <%=iconecategory%>"></i>',
  #         marker_color: "text-color-#{proposition.category}"
  #       }
  #     end
  #   end
  #  end


  private

  def proposition_params
    params.require(:proposition).permit(:trip_id, :user_id, :category, :start_date, :end_date, :due_date, :title, :description, :url, :address)
  end

end

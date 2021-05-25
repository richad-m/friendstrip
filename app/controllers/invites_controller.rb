class InvitesController < ApplicationController
 #Richad a code trop vite ce controller

  def index
    @invites = Invite.where(user_id: current_user.id)
    @pending_invites = @invites.select {|invite| invite.accepted = false}
    @accepted_invites = @invites.select {|invite| invite.accepted = true}
  end

  def new
    @invite = Invite.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @invite = Invite.new(invite_params)
    @trip = Trip.find(params[:trip_id])
    @invite.trip = @trip
    #Getting email from form
    email = params[:invite][:email]
    #Getting user from email submitted by the user
    user = User.find_by(email: email)
    if user 
      @invite.user = user
    end
    if @invite.save
      redirect_to trip_path(@trip.id)  
    else
      render :new
    end
  end

  def invite_params
    params.require(:invite).permit(:trip_id)
  end
end

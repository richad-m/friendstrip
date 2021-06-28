class InvitesController < ApplicationController
 #Richad a code trop vite ce controller
 protect_from_forgery with: :null_session

  def index
    @invites = policy_scope(Invite).select {|invite| invite.user_id == current_user}
    @pending_invites = @invites.select {|invite| invite.accepted.nil?}.uniq
    @accepted_invites = @invites.select {|invite| invite.accepted?}.uniq
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
      redirect_to trip_path(@trip.id)
    end
    if @invite.save
      flash.notice = "#{@invite.user.first_name} has been invited to #{@invite.trip.title}"
      redirect_to trip_path(@trip.id)
    else
      flash.alert = "#{email} doesn't have a Friends Trip account yet."
      redirect_to trip_path(@trip.id)
    end
  end

  def accept
    # raise
    @invite = Invite.find(params[:id])
    @invite.accepted = true
    if @invite.save
      flash.notice = "You successfully joined #{@invite.trip.title}"
      redirect_to trip_path(@invite.trip)
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:trip_id)
  end
end

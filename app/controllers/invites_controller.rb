class InvitesController < ApplicationController
 #Richad a code trop vite ce controller
 protect_from_forgery with: :null_session

  def index
    @invites = policy_scope(Invite).select {|invite| invite.user_id == current_user.id}
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
    authorize @invite
    if user
      @invite.user = user
    end
    if @invite.save
      flash.notice = "#{@invite.user.first_name} has been invited to #{@invite.trip.title}"
    else
      flash.alert = "#{email} doesn't have a Friends Trip account yet."

    end
    redirect_to trip_path(@trip.id)
  end

  def accept
    # raise
    @invite = Invite.find(params[:id])
    @invite.accepted = true
    authorize @invite
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

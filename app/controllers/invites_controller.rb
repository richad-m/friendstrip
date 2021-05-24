class InvitesController < ApplicationController

  def new
    @invite = Invite.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @invite = Invite.new(invite_params)
    @trip = Trip.find(params[:trip_id])
    @invite.trip_id = @trip.id
    @invite.save
    redirect_to trips_path
  end

  def accept
    @invite = Invite.find(params[:id])
    @invite.accepted = true
    redirect_to trips_path
  end

  private

  def invite_params
    params.require(:invite).permit(:user_id, :trip_id, :accepted)
  end
end

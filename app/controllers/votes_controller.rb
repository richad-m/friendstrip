class VotesController < ApplicationController
 #Richad a code trop vite ce controller

  def new
    @vote = Vote.new
    @proposition = Proposition.find(params[:proposition_id])
  end

  def create
    @proposition = Proposition.find(params[:proposition_id])
    @vote = Vote.new(vote_params)
    @vote.proposition_id = @proposition.id
    @vote.user_id = current_user.id
    authorize @vote
    if @vote.save
      flash.notice = "Your vote has been submitted"
      redirect_to trip_path(@proposition.trip, anchor: "prop-#{@proposition.id}")
    else
      # flash.notice = "You already liked / disliked that proposition!"
      redirect_to trip_path(@proposition.trip, anchor: "prop-#{@proposition.id}")
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:comment, :status)
  end
end

class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @proposition = Proposition.find(params[:proposition_id])
    @vote.proposition_id = @proposition.id
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to trip_path(@proposition.trip_id)
    else
      render :new
    end
  end

  def upvote
    @vote = Vote.find(params[:id])
    @vote.status = true
    @vote.save
  end

  def downvote
    @vote = Vote.find(params[:id])
    @vote.status = false
    @vote.save
  end

  def vote_params
    params.require(:vote).permit(:user_id, :proposition_id, :comment, :status)
  end
end

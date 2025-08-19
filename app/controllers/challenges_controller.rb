class ChallengesController < ApplicationController
  def index
    @challenges = current_user.challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path, status: :see_other
  end
end

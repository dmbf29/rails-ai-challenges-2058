class ChallengesController < ApplicationController
  def index
    @challenges = current_user.challenges
     respond_to do |format|
       format.html { render 'index'}
       format.json { render json: @challenges }
     end
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

class PointsController < ApplicationController

  def create

    Point.create(
      user_id: current_user.id,
      total_points: params[:points]) 
    redirect_to "/bets"
  end 
end

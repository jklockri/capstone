class PointsController < ApplicationController

  def create
    point=Point.find_by("user_id=?", current_user.id)
    point.total_points=point.total_points += params[:points].to_i
      user_id = current_user.id
      point.save
    redirect_to "/bets"
  end 
end

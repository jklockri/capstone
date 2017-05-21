class WinsController < ApplicationController

  def new
    @bet= Bet.find_by(id: params[:id]) 
    render "new.html.erb"
  end

  def create
    bet = Bet.find_by(id: params[:id])

    
    winner=Win.new(
      bet_id: bet.id,
      user_id: params[:winner],
      win: true
      )
    winner.save
    if params[:winner]==bet.first_user.id
      lost=bet.second_user.id
      
      winner_point=Point.find_by("user_id=?", bet.first_user.id)
      winner_point.total_points=winner_point.total_points + bet.amount.to_i * 2
      winner_point.save
    else 
      lost=bet.first_user.id
      
      winner_point=Point.find_by("user_id=?", bet.second_user.id)
      winner_point.total_points=winner_point.total_points + bet.amount.to_i * 2
      winner_point.save
    end
    loser=Win.new( 
      bet_id: bet.id,
      user_id: lost,
      win: false)
    loser.save
    redirect_to '/bets'
  end 
end

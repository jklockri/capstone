class WinsController < ApplicationController

  def new
    @bet= Bet.find_by(id: params[:id]) 
    render "new.html.erb"
  end

  def create
    bet = Bet.find_by(id: params[:id])
    puts params[:winner] 
    winner=Win.new(
      bet_id: bet.id,
      user_id: params[:winner],
      win: true
      )
    winner.save
    if params[:winner]==bet.first_user.id
      lost=bet.second_user.id
    else 
      lost=bet.first_user.id
    end
    loser=Win.new( 
      bet_id: bet.id,
      user_id: lost,
      win: false)
    loser.save
    redirect_to '/'
  end 
end

class RatingsController < ApplicationController


  def new 
    @bet=Bet.find_by(id: params[:id])
    

    if params[:type] == "judge"
      @message = "#{@bet.master_judge.name.capitalize} as a judge on a scale of 1-10:"
    elsif params[:type] == "player" && current_user.id != @bet.first_user.id 
      @message = "#{@bet.first_user.name.capitalize} as a player on a scale of 1-10:"
    else params[:type] == "player" && current_user.id != @bet.second_user.id 
      @message = "#{@bet.second_user.name.capitalize} as a player on a scale of 1-10:"
    end
    render "new.html.erb"
  end 


  def create 
    bet=Bet.find_by(id: params[:id])
    player_rating = 0
    judge_rating = 0

   
    
    if params[:job] == "judge"
      player_id = bet.master_judge.id
      judge_rating = params[:rating]
    elsif params[:job] == "player"
      if current_user.id == bet.first_user.id
        player_id = bet.second_user.id
      else current_user.id == bet.second_user.id
        player_id = bet.first_user.id
      end

      player_rating = params[:rating] 
    end

    rating=Rating.new(
      user_id: player_id,
      bet_id: bet.id,
      player_rating: player_rating,
      judge_rating: judge_rating)
    rating.save


    redirect_to "/bets"
  end 
end

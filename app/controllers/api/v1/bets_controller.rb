class Api::V1::BetsController < ApplicationController

  def index
    @bets=Bet.all
    render "index.json.jbuilder"  
  end 

  def create
    user2 =  User.find_by(name: params[:second_user]) 
    judge = User.find_by(name: params[:master_judge])
    bet=Bet.new( 
      user_1: current_user.id,
      user_2: user2.id,
      amount: params[:amount],
      judge: judge.id,
      terms: params[:terms]
      )
    bet.save
    redirect_to "/"
  end 



  def update 
    bet= Bet.find_by(id: params[:id])
    user2 =  User.find_by(name: params[:second_user]) 
    judge = User.find_by(name: params[:master_judge])
    
    bet.user_1.id = current_user.id
    bet.user_2.id = user2.id,
    bet.amount= params[:amount]
    bet.judge = judge.id
    bet.terms= params[:terms]
    bet.save
    redirect_to "/bets"
  end 

  def destroy
    @bet= Bet.find_by(id: params[:id])
    @bet.destroy
    redirect_to "/"
  end 

end

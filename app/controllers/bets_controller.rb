class BetsController < ApplicationController

  def index
    gon.current_user=current_user
    render "index.html.erb"
  end 

  def new
    render "new.html.erb"
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

  def show
    @bet= Bet.find_by(id: params[:id])
    render "show.html.erb"
  end 

  def edit
    @bet= Bet.find_by(id: params[:id])
    render "edit.html.erb"
  end 

  def update 
    @bet= Bet.find_by(id: params[:id])
    user2 =  User.find_by(name: params[:second_user]) 
    judge = User.find_by(name: params[:master_judge])
    @bet.update(
      user_1: current_user.id,
      user_2: user2.id,
      amount: params[:amount],
      judge: judge.id,
      terms: params[:terms]
    )
    redirect_to "/bets"
  end 

  def destroy
    @bet= Bet.find_by(id: params[:id])
    @bet.destroy
    redirect_to "/"
  end 

end

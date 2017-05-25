class Api::V1::BetsController < ApplicationController

  def index
    @user = current_user.id
    @bets = []
    gon.current_user=current_user
    
    if ((Bet.where(user_1: @user)) && Bet.where(user_1: @user) != nil)
      @bet1 = Bet.where(user_1: @user).to_a
      @bets << @bet1
    end
    if ((Bet.where(user_2: @user)) && Bet.where(user_2: @user) != nil)
      @bet2 = Bet.where(user_2: @user).to_a
      @bets << @bet2
    end
    if ((Bet.where(judge: @user)) && Bet.where(judge: @user) != nil)
      @bet3 = Bet.where(judge: @user).to_a
      @bets << @bet3
    end
    @bets=@bets.flatten
    if params[:type] == "judged"
      @bets = Bet.where(judge: @user)
    elsif params[:type]=="involved"
      @bets=[]
      @bets<<@bet1
      @bets<<@bet2
      
      @bets = @bets.flatten.sort_by!{|x| x[:created_at]}.reverse
      
    return @bets 
    end
    
    render "index.json.jbuilder"  
  end 

  def show
    @bet=Bet.find_by(id: params[:id])
    render 'show.json.jbuilder'

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

  def total_profit_graph
    @user = current_user.id
    @bets = []
    gon.current_user=current_user
    
    if ((Bet.where(user_1: @user)) && Bet.where(user_1: @user) != nil)
      @bet1 = Bet.where(user_1: @user).to_a
      @bets << @bet1
    end
    if ((Bet.where(user_2: @user)) && Bet.where(user_2: @user) != nil)
      @bet2 = Bet.where(user_2: @user).to_a
      @bets << @bet2
    end
    if ((Bet.where(judge: @user)) && Bet.where(judge: @user) != nil)
      @bet3 = Bet.where(judge: @user).to_a
      @bets << @bet3
    end
    @bets=@bets.flatten
    if params[:type] == "judged"
      @bets = Bet.where(judge: @user)
    elsif params[:type]=="involved"
      @bets=[]
      @bets<<@bet1
      @bets<<@bet2
    end
      
    @bets=@bets.flatten

    @x=@bets.map {|bet| bet.created_at}
    @y=@bets.map {|bet| bet.amount}
    @points=[]
    @bets.each do |bet|
      x=bet.amount
      y=bet.id
      
      @points<<[x,y]
    end 
    render "total_profit_graph.json.jbuilder"
  end 

  def events 
    @user = current_user.id
    @bets = []
    gon.current_user=current_user
    
    if ((Bet.where(user_1: @user)) && Bet.where(user_1: @user) != nil)
      @bet1 = Bet.where(user_1: @user).to_a
      @bets << @bet1
    end
    if ((Bet.where(user_2: @user)) && Bet.where(user_2: @user) != nil)
      @bet2 = Bet.where(user_2: @user).to_a
      @bets << @bet2
    end
    if ((Bet.where(judge: @user)) && Bet.where(judge: @user) != nil)
      @bet3 = Bet.where(judge: @user).to_a
      @bets << @bet3
    end
    @bets=@bets.flatten
    if params[:type] == "judged"
      @bets = Bet.where(judge: @user)
    elsif params[:type]=="involved"
      @bets=[]
      @bets<<@bet1
      @bets<<@bet2
    end
      
    @bets=@bets.flatten
   
    render 'events.json.jbuilder'
  end 

  def player_vs_player

      @user = current_user.id
    @bets = []
    gon.current_user=current_user
    
    if ((Bet.where(user_1: @user)) && Bet.where(user_1: @user) != nil)
      @bet1 = Bet.where(user_1: @user).to_a
      @bets << @bet1
    end
    if ((Bet.where(user_2: @user)) && Bet.where(user_2: @user) != nil)
      @bet2 = Bet.where(user_2: @user).to_a
      @bets << @bet2
    end
    if ((Bet.where(judge: @user)) && Bet.where(judge: @user) != nil)
      @bet3 = Bet.where(judge: @user).to_a
      @bets << @bet3
    end
    @bets=@bets.flatten
    if params[:type] == "judged"
      @bets = Bet.where(judge: @user)
    elsif params[:type]=="involved"
      @bets=[]
      @bets<<@bet1
      @bets<<@bet2
    end
      
    @bets=@bets.flatten
    @p1=[]
    @p2=[]
    @p3=[]
    @p4=[]
    @p5=[]
    @p6=[]

    @bets.each do |bet|
      if  3 == bet.first_user.id.to_i + bet.second_user.id.to_i
        @p1<<bet.first_user

      elsif 4 == bet.first_user.id.to_i + bet.second_user.id.to_i
        @p2 << bet.first_user

      elsif 5== bet.first_user.id.to_i + bet.second_user.id.to_i 
        if bet.first_user.id ==1 || bet.second_user == 1
          @p3 << bet.first_user
        else
          @p4 <<bet.first_user
        end
      elsif  6 == bet.first_user.id.to_i + bet.second_user.id.to_i
        @p5 <<bet.first_user
      elsif  7 == bet.first_user.id.to_i + bet.second_user.id.to_i
        @p6 << bet.first_user 
      end 
    end 
  render "player_vs_player.json.jbuilder"
  end 

end

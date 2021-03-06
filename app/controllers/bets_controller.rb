class BetsController < ApplicationController


  def index
    gon.current_user=current_user
    @ratings= Rating.where("user_id=?", current_user.id)
    @points= Point.where("user_id=?", current_user.id)

    @user = current_user.id
    @bets = []
    
    
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

    
    @bets_total = 0
    @bets.each do |bet|
      bet.wins.each do |win|
        if win.user_id == current_user.id
          if win.win == true
            @bets_total += bet.amount
          else win.win == false 
            @bets_total -= bet.amount 
          end
        end
      end
    end
    @total_judge_rating= @ratings.inject(0){|sum,rating| sum += rating.judge_rating}
    @total_player_rating= @ratings.inject(0){|sum,rating| sum += rating.player_rating}
    @total_points= @points.inject(0){|sum,point| sum += point.total_points}
      # puts "==========================="
      # @bets = @bets.flatten.sort_by!{|x| x[:created_at]}
      # @bets.each do |bet|
      #   puts bet.created_at
      # end 
      # puts "==========================="
      @bets = @bets.flatten.sort_by!{|x| x[:created_at]}


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

      point = Point.find_by("user_id=?", current_user.id)
      point.total_points = point.total_points - params[:amount].to_i 
      point.save

      other_point = Point.find_by("user_id=?", user2.id)
      other_point.total_points = other_point.total_points - params[:amount].to_i
      other_point.save

      redirect_to "/bets"
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
      redirect_to "/bets"
    end 

    def calendar 
      render "calendar.html.erb"
    end 

    def timeline
      @user = current_user.id
      @bets = []


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
      @bets = @bets.flatten


      render "timeline.html.erb"
    end

    def points 
      render "points.html.erb"
    end

    def graphs
      @user = current_user.id
      @bets = []


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
      @bets = @bets.flatten

      @x=@bets.map {|bet| bet.created_at}
      @y=@bets.map {|bet| bet.amount}

    # puts "==============================="
    # p @something = Bet.where("user_1=?", current_user).or(Bet.where("user_2=?",current_user)).group(:created_at).sum(:amount)
    
    # puts "================================"

    @array=[]
    @bets.each do |bet|
      bet.wins.each do |win|
        if win.user_id == current_user.id
          if win.win == true
            @array << bet
          else win.win == false 
            bet.amount = bet.amount * -1 
            @array << bet
          end
        end
      end
    end

    render "graphs.html.erb"
  end 

end

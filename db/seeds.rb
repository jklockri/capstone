names=["jay","test","alayna","someone"]

names.each do |name|
  user=User.new(name:name, email: "#{name}@gmail.com", password: "password", password_confirmation: "password") 
  user.save
  2.times do 
    bet=Bet.new(
    user_1: user.id,
    user_2: [1,2,3,4].sample != user.id,
    amount: rand(1...100),
    terms: Faker::Hipster.sentence(5),
    judge: [1,2,3,4].sample != user.id
    )
    bet.save
  end
end

bets=Bet.all

3.times do 
  bets.each do |bet|
    Job.create(
      job: ["player","judge"].sample,
      user_id: [1,2,3,4].sample,
      bet_id: bet.id
      )

    Rating.create(
      user_id: [1,2,3,4].sample,
      player_rating: [0,1].sample,
      judge_rating: [0,1].sample,
      bet_id: bet.id
      )
  end  
end 

2.times do 
  bets.each do |bet|
    Win.create(
        win: Faker::Boolean.boolean,
        user_id:[1,2,3,4].sample,
        bet_id: bet.id
        )
  end 
end 

puts "End"
class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :wins
  has_many :ratings
  # has_many :user_1_bets, class_name: "Bet", foreign_key: "user_1"  
  # has_many :user_2_bets, class_name: "Bet", foreign_key: "user_2"  
  # has_many :judged_bets, class_name: "Bet", foreign_key: "judge" 

end

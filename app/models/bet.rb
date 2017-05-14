class Bet < ApplicationRecord
  belongs_to :first_user, class_name: "User", foreign_key: "user_1", optional: true  
  belongs_to :second_user, class_name: "User", foreign_key: "user_2", optional: true
  belongs_to :master_judge, class_name: "User", foreign_key: "judge", optional: true
  has_many :wins


 


  def number 
    4
  end  


end

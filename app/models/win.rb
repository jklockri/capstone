class Win < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :bet, optional: true
  
end

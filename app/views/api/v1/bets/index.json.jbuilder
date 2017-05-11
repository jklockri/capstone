json.array! @bets.each do |bet|
  json.id bet.id
  json.first_user bet.first_user
  json.second_user bet.second_user
  json.master_judge bet.master_judge
  json.amount bet.amount
  json.terms bet.terms
  json.created_at bet.created_at.strftime("%m/%d/%Y")
  json.wins bet.wins.each do |win|
    json.id win.id
    json.win win.win
    json.name win.user.name

  end

end 



json.array! @bets.each do |bet|
  json.id bet.id 
  json.title "#{bet.first_user.name} vs #{bet.second_user.name}"
  json.start bet.created_at 
  json.end bet.created_at 
  json.description bet.terms 
  json.url bets_url(@bet)
end  
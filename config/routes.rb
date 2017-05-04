Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do  
      get "/" => "bets#index"
      get "/bets" => 'bets#index'
      post '/bets' => 'bets#create'
      patch '/bets/:id' => 'bets#update'
      delete 'bets/:id' => 'bets#destroy'
    end 
  end

  get "/" => "bets#index"
  get "/bets" => 'bets#index'
  get '/bets/new' => 'bets#new'
  post '/bets' => 'bets#create'
  get '/bets/:id' => 'bets#show'
  get '/bets/:id/edit' => 'bets#edit'
  patch '/bets/:id' => 'bets#update'
  delete 'bets/:id' => 'bets#destroy'

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/judge/new"=> "wins#new"
  post "judge/:id" => "wins#create"
end

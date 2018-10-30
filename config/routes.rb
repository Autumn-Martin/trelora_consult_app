Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/find', to: 'find#show'
  get '/prepare', to: 'prepare#show'
  get '/collect', to: 'collect#new'
  post '/collect', to: 'collect#create'
  get '/success', to: 'collect#success'
end

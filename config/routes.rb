Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/find', to: 'find#show'
  get '/prepare', to: 'prepare#show'
end

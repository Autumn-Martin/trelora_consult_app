Rails.application.routes.draw do
  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/find', to: 'find#show'
  get '/prepare', to: 'prepare#show'
  get '/collect', to: 'collect#new'
  post '/collect', to: 'collect#create'
  get '/success', to: 'collect#success'
end

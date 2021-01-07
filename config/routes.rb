Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/shoes/expensive', to: 'shoes#expensive', as: 'expensive_shoe'
  resources :shoes

  # get '/shoes', to: 'shoes#index'
  # post '/shoes', to: 'shoes#create'
  # get '/shoes/new', to: 'shoes#new', as: 'new_shoe'
  # get '/shoes/:id', to: 'shoes#show', as: 'shoe'

  


end

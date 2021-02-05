Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  match 'auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]

  get '/shoes/expensive', to: 'shoes#expensive', as: 'expensive_shoe'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  resources :shoes

  resources :brands do 
    resources :shoes, shallow: true
  end

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'brands#index'

  get '/shoes/expensive', to: 'shoes#expensive', as: 'expensive_shoe'

  resources :shoes, only: [:index, :new, :create]

  resources :brands do 
    resources :shoes, shallow: true
  end

end

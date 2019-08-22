Rails.application.routes.draw do
  # get 'bookings/show'
  # get 'bookings/create'
  # get 'bookings/destroy'
  # get 'kitties/index'
  # get 'kitties/show'
  # get 'kitties/create'
  # get 'kitties/update'
  # get 'kitties/edit'
  # get 'kitties/destroy'
  # get 'kitties/new'
  get 'kitties/donate', to: 'kitties#donate', as: :kitty_donate

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kitties do
    resources :bookings, only: %i[index new create]
    resources :reviews, only: [ :new, :create ]
  end
  resources :bookings, only: %i[show destroy]
end

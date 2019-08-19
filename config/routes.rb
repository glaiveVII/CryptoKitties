Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :kitties do
    resources :bookings, only: %i[show create destroy]
  end
  devise_for :users
end

Rails.application.routes.draw do
  namespace :api do
    resources :products
    post '/login', to: 'auth#authenticate'
    post '/users', to: 'users#create'
  end
end

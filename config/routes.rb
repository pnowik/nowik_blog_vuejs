Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  resources :posts do
    resources :comments
  end
end

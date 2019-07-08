Rails.application.routes.draw do

  namespace :admin do
    root to: 'admin/posts#index'
    resources :posts
  end
  root to: 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments do
      member do
        put :publish
      end
    end
  end

end

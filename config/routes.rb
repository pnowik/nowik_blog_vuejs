Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments do
      member do
        put :publish
      end
    end
  end
end

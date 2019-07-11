Rails.application.routes.draw do

  devise_for :users, :path_prefix => 'my'

  namespace :admin do
    root to: 'admin/posts#index'
    resources :users
    resources :posts do
      resources :comments do
        member do
          put :publish
          put :unpublish
        end
      end
    end
  end

  root to: 'posts#index'

  resources :posts do
    resources :comments do
      member do
        put :publish
        put :unpublish
      end
    end
  end

end

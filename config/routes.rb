Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  devise_for :users
  root 'root#home'

  controller :root do
    get :home
    get :privacy
    get :about
  end

  resources :rooms

<<<<<<< HEAD
  resources :users, only: [:index, :show] 
=======
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
>>>>>>> following-users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

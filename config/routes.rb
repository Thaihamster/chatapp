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

  resources :users, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

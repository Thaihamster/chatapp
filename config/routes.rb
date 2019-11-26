Rails.application.routes.draw do
  devise_for :users
  root 'root#home'

  controller :root do
    get :home
    get :privacy
    get :about
  end

  resources :rooms, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'questions', to: 'pages#questions', as: :questions
  get 'matches', to: 'pages#matches', as: :matches
  get 'plant_patch', to: 'pages#plant_patch', as: :plant_patch
  get 'about_us', to: 'pages#about_us', as: :about_us

  resources :plants, only: [:index, :show] do
    #resources :user_plants, only: [:new, :create]
  end
  resources :user_plants, only: [:create, :show, :edit, :update, :destroy]

  post 'matches', to: 'pages#create_match', as: :matches_new
end

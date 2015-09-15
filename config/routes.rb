Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :races, only: [:show]
  resources :bills, only: [:show]
  resources :legislators, only: [:index, :show]
  resources :users, only: [:show, :update]
  resources :sign_up_steps

  post 'races/follow' => 'races#follow', as: :follow_race
  post 'races/unfollow' => 'races#unfollow', as: :unfollow_race

  post 'users/follow' => 'users#follow', as: :follow
  post 'users/unfollow' => 'users#unfollow', as: :unfollow

  root 'welcome#index'

end

Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  root 'questions#index'

  resources :users
  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'best' => 'answers#best'

  resources :tags, :only => [:index, :show]

  resources :comments

  resources :votes, :only => [:create]
end

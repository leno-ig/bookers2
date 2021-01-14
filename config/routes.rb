Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  get '/home/about' => 'homes#about'
  resources :books
  resources :users, excetp: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: "homes#top"
  get 'home/about' => "homes#about"

  devise_for :users

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get "followings" => "relationships#followings",as: "followings"
    get "followers" => "relationships#followers",as: "followers"
  end


  resources :notes, only: [:new,:index,:show,:edit,:create,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

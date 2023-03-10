Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => "homes#about"

  devise_for :users

  get "search" => "searchs#search"

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get "followings" => "relationships#followings",as: "followings"
    get "followers" => "relationships#followers",as: "followers"
  end


  resources :notes, only: [:new,:index,:show,:edit,:create,:update,:destroy] do
    resources :note_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
    get "favorite" => "favorites#favorite"
  end

  resources :categories, only: [:create,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

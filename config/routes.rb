Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users,only: [:show,:edit,:update,:index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :texts,only: [:new,:create,:show,:edit,:destroy,:update,:index] do
    resources :bookmarks,only: [:create,:destroy]
    resources :comments, only: [:create,:destroy]
  end
  resources :bookmarks,only: [:index]

  get '/search', to: 'searchs#search'

  resources :tags,only: [:index,:create,:destroy]
  get '/search_tags', to: 'tags#search'
end

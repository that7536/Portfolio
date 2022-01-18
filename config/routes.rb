Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users,only: [:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  get 'users/unsubscrube'
  get 'users/withdraw'

  resources :texts,only: [:new,:create,:show,:edit,:destroy]

  resources :bookmarks,only: [:create,:index,:destroy]

  get 'tags/create'
  get 'tags/destroy'
end

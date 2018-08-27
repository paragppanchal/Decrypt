Rails.application.routes.draw do
  devise_for :users
  get 'exchanges/index'
  get 'exchanges/show'
  get 'buy/bitcoin', to: 'buy_rate#bitcoin', as: :buy_bitcoin
  get 'sell/bitcoin', to: 'sell_rate#bitcoin', as: :sell_bitcoin
  # get 'buy/:coin', to: "buy_rate#buy", as: :buy_coin

  get 'learn', to: 'learning_portal#home', as: :learn
  get 'learn/bitcoin', to: 'learning_portal#bitcoin', as: :learn_bitcoin
  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
end

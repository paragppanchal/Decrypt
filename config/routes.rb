Rails.application.routes.draw do
  devise_for :users
  get 'exchanges/index'
  get 'exchanges/show'
  get 'buy/bitcoin', to: 'buy_rate#bitcoin', as: :buy_bitcoin
  get 'sell/bitcoin', to: 'sell_rate#bitcoin', as: :sell_bitcoin

  # get 'buy/:coin', to: "buy_rate#buy", as: :buy_coin

  get 'learn', to: 'learning_portal#bitcoin', as: :learn

  get 'learn/bitcoin', to: 'learning_portal#bitcoin', as: :learn_bitcoin
  get 'learn/bitcoin/:id', to: 'learning_portal#show', as: :learn_bitcoin_show
  get 'learn/introduction-to-cryptocurrency', to: 'learning_portal#introduction', as: :learn_intro
  get 'learn/cryptocurrency-origin', to: 'learning_portal#origin', as: :learn_origin
  get 'learn/cryptocurrency-pros-cons', to: 'learning_portal#proscons', as: :learn_proscons
  get 'learn/cryptocurrency-types', to: 'learning_portal#types', as: :learn_type
  get 'learn/cryptocurrency-risks-dangers', to: 'learning_portal#risks-dangers', as: :learn_risk
  get 'learn/cryptocurrency-legalities', to: 'learning_portal#legalities', as: :learn_legalities
  get 'learn/cryptocurrency-wallets', to: 'learning_portal#wallets', as: :learn_wallets
  get 'learn/cryptocurrency-tips', to: 'learning_portal#tips', as: :learn_tips
  get 'learn/cryptocurrency-future', to: 'learning_portal#future', as: :learn_future


  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
end

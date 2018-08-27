Rails.application.routes.draw do
  devise_for :users
  get 'exchanges/index'
  get 'exchanges/show'
  get 'buy/bitcoin', to: 'buy_rate#bitcoin', as: :buy_bitcoin
  get 'sell/bitcoin', to: 'sell_rate#bitcoin', as: :sell_bitcoin
  get 'learn', to: 'learning_portal#bitcoin', as: :learn
  get 'learn/bitcoin', to: 'learning_portal#bitcoin', as: :learn_bitcoin
  get 'learn/bitcoin/:id', to: 'learning_portal#show', as: :learn_bitcoin_show
  get 'learn/introduction-to-cryptocurrency', to: 'learning_portal#introduction'
  get 'learn/cryptocurrency-origin', to: 'learning_portal#origin'
  get 'learn/cryptocurrency-pros-cons', to: 'learning_portal#proscons'
  get 'learn/cryptocurrency-types', to: 'learning_portal#types'
  get 'learn/cryptocurrency-risks-dangers', to: 'learning_portal#risks-dangers'


  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
end

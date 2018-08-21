Rails.application.routes.draw do
  get 'exchanges/index'
  get 'exchanges/show'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'buy/bitcoin', to: 'buy_rate#bitcoin', as: :buy_bitcoin
  get 'sell/bitcoin', to: 'sell_rate#bitcoin', as: :sell_bitcoin
  get 'learn', to: 'learning_portal#home', as: :learn
  get 'learn/bitcoin', to: 'learning_portal#bitcoin', as: :learn_bitcoin
  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

class MarketSnapshot < ApplicationRecord
  belongs_to :exchange
  belongs_to :base_coin, class_name: :Coin, foreign_key: :base_coin_id
  belongs_to :quote_coin, class_name: :Coin, foreign_key: :quote_coin_id
end

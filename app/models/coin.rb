class Coin < ApplicationRecord
  has_many :base_market_snapshots, class_name: :MarketSnapshot, source: :base_coin
  has_many :quote_market_snapshots, class_name: :MarketSnapshot, source: :quote_coin
end

class Exchange < ApplicationRecord
  has_many :reviews

  has_one :market_snapshot
end

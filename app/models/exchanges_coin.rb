class ExchangesCoin < ApplicationRecord
  belongs_to :exchange
  belongs_to :coin
end

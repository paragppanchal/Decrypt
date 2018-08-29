require 'json'
require 'open-uri'

# Currency Symbol:
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class LykkeExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'USD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL : https://public-api.lykke.com/api/AssetPairs/rate/{currency_pair}
    # e.g   https://public-api.lykke.com/api/AssetPairs/rate/BTCUSD

    #response:
     # {
     #  "id": "string",
     #  "bid": 0,
     #  "ask": 0
     # }

    url = "https://public-api.lykke.com/api/AssetPairs/rate/#{@base_currency_code}#{@quote_currency_code}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["ask"].to_f
  end

  def fetch_sell_price!
    url = "https://public-api.lykke.com/api/AssetPairs/rate/#{@base_currency_code}#{@quote_currency_code}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Selling BTC/USD => Bid price
    @sell_price = response["bid"].to_f
  end

  private

  def fetch_from_url(url)
    resopnse_seialized = open(url).read
    response_json = JSON.parse(resopnse_seialized)
    return response_json
  end

end

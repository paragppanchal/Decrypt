require 'json'
require 'open-uri'

# Currency Symbol:
# currency symbols (currency pairs) traded on HitBTC exchange.
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class HitbtcExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'USD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL:  https://api.hitbtc.com/api/2/public/ticker/BTCUSD
    #response:
    # {
    #     "ask": "6376.93",
    #     "bid": "6376.00",
    #     "last": "6376.03",
    #     "open": "6437.47",
    #     "low": "6018.83",
    #     "high": "6506.58",
    #     "volume": "11092.42",
    #     "volumeQuote": "70892765.1141",
    #     "timestamp": "2018-08-21T07:04:00.001Z",
    #     "symbol": "BTCUSD"
    # }

    url = "https://api.hitbtc.com/api/2/public/ticker/#{@base_currency_code}#{@quote_currency_code}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["ask"].to_f

  end

  def fetch_sell_price!
    url = "https://api.hitbtc.com/api/2/public/ticker/#{@base_currency_code}#{@quote_currency_code}"
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

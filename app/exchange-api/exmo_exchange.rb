require 'json'
require 'open-uri'

# Currency Symbol:
# currency symbols (currency pairs) traded on HitBTC exchange.
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

class ExmoExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'AUD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL: https://api.exmo.com/v1/ticker/
    #response:
    # {
    #     "BTC_USD": {
    #         "buy_price": "6504.70621213",
    #         "sell_price": "6510.4",
    #         "last_trade": "6504.70621213",
    #         "high": "6546.99999999",
    #         "low": "6320.968395",
    #         "avg": "6442.04594785",
    #         "vol": "900.5282987",
    #         "vol_curr": "5862799.43591858",
    #         "updated": 1534789513
    #     },
    #     "BTC_EUR": {
    #         "buy_price": "5677.9882079",
    #         "sell_price": "5699.87354302",
    #         "last_trade": "5689.1",
    #         "high": "5719.88029912",
    #         "low": "5500",
    #         "avg": "5614.85728615",
    #         "vol": "301.6866222",
    #         "vol_curr": "1716325.36235945",
    #         "updated": 1534839236
    #     },.............
    #     ..........
    #   }

    url = "https://api.exmo.com/v1/ticker/"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here
    currency_pair_response = response["#{@base_currency_code}_#{@quote_currency_code}"]

    # when Buying BTC/USD => Ask price
    @buy_price = currency_pair_response["buy_price"].to_f

  end

  def fetch_sell_price!
    url = "https://api.exmo.com/v1/ticker/"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here
    currency_pair_response = response["#{@base_currency_code}_#{@quote_currency_code}"]
    # when Selling BTC/USD => Bid price
    @sell_price = currency_pair_response["sell_price"].to_f
  end

  private

  def fetch_from_url(url)
    resopnse_seialized = open(url).read
    response_json = JSON.parse(resopnse_seialized)
    return response_json
  end

end

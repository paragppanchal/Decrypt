require 'json'
require 'open-uri'

# Currency Symbol:
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class BitstampExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'USD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL:  https://www.bitstamp.net/api/v2/ticker/{currency_pair}/
    # Supported values for currency_pair: btcusd, btceur, eurusd, xrpusd, xrpeur,
    # xrpbtc, ltcusd, ltceur, ltcbtc, ethusd, etheur, ethbtc, bchusd, bcheur, bchbtc
    #response:
     #  {
     #     "high": "7125.28",
     #     "last": "7070.45",
     #     "timestamp": "1535502029",
     #     "bid": "7063.04",
     #     "vwap": "7002.71",
     #     "volume": "8164.95195748",
     #     "low": "6861.17",
     #     "ask": "7071.70",
     #     "open": "7079.46"
     # }

    url = "https://www.bitstamp.net/api/v2/ticker/#{@base_currency_code.downcase}#{@quote_currency_code.downcase}/"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["ask"].to_f

  end

  def fetch_sell_price!

    url = "https://www.bitstamp.net/api/v2/ticker/#{@base_currency_code.downcase}#{@quote_currency_code.downcase}/"
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

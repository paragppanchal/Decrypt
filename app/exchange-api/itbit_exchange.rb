require 'json'
require 'open-uri'

# Currency Symbol:
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class ItbitExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'AUD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL:  https://api.itbit.com/v1/markets/{tickerSymbol}/ticker
    # NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
    # bitcoin symbole and NOT BTC

    #response:
    #  {
    #     "pair": "XBTUSD",
    #     "bid": "6689.65",
    #     "bidAmt": "2.1408",
    #     "ask": "6694.16",
    #     "askAmt": "1.3913",
    #     "lastPrice": "6694.42000000",
    #     "lastAmt": "0.40000000",
    #     "volume24h": "2136.31980000",
    #     "volumeToday": "814.23300000",
    #     "high24h": "6903.36000000",
    #     "low24h": "6285.81000000",
    #     "highToday": "6903.36000000",
    #     "lowToday": "6440.83000000",
    #     "openToday": "6477.89000000",
    #     "vwapToday": "6703.19495129",
    #     "vwap24h": "6529.89765601",
    #     "serverTimeUTC": "2018-08-22T02:17:06.4244488Z"
    # }

    url = "https://api.itbit.com/v1/markets/#{base_currency_code}#{quote_currency_code}/ticker"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["ask"].to_f

  end

  def fetch_sell_price!
    url = "https://api.itbit.com/v1/markets/#{base_currency_code}#{quote_currency_code}/ticker"
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

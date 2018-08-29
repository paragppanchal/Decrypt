require 'json'
require 'open-uri'

# Currency Symbol:
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class KrakenExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'USD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL : https://api.kraken.com/0/public/Ticker?pair=X{base_currency}Z{quote_currency}
    # e.g   https://api.kraken.com/0/public/Ticker?pair=XXBTZUSD
    # Bitcoin -> XBT  , US Dollar -> USD
    # NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
    # bitcoin symbole and NOT BTC

    #response:
    # a = ask array(<price>, <whole lot volume>, <lot volume>),
    # b = bid array(<price>, <whole lot volume>, <lot volume>),
    # c = last trade closed array(<price>, <lot volume>),
    # v = volume array(<today>, <last 24 hours>),
    # p = volume weighted average price array(<today>, <last 24 hours>),
    # t = number of trades array(<today>, <last 24 hours>),
    # l = low array(<today>, <last 24 hours>),
    # h = high array(<today>, <last 24 hours>),
    # o = today's opening price

    if @base_currency_code == 'BTC'
      bcc = 'XBT'
    else
      bcc = @base_currency_code
    end

    url = "https://api.kraken.com/0/public/Ticker?pair=X#{bcc}Z#{@quote_currency_code}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["result"]["X#{bcc}Z#{@quote_currency_code}"]["a"][0].to_f
  end

  def fetch_sell_price!
    if @base_currency_code == 'BTC'
      bcc = 'XBT'
    else
      bcc = @base_currency_code
    end
    url = "https://api.kraken.com/0/public/Ticker?pair=X#{bcc}Z#{@quote_currency_code}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Selling BTC/USD => Bid price
    @sell_price = response["result"]["X#{bcc}Z#{@quote_currency_code}"]["b"][0].to_f
  end

  private

  def fetch_from_url(url)
    resopnse_seialized = open(url).read
    response_json = JSON.parse(resopnse_seialized)
    return response_json
  end

end

require 'json'
require 'open-uri'

# Currency Symbol:
# The first listed currency of a symbol is called the base currency,
# and the second currency is called the quote currency.
# The currency pair indicates how much of the quote currency is needed
# to purchase one unit of the base currency

# when Buying BTC/USD => Ask price
# when Selling BTC/USD => Bid price

class IndependentreserveExchange

  attr_accessor :base_currency_code, :quote_currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, quote_currency_code = 'USD')
    @base_currency_code = base_currency_code
    @quote_currency_code = quote_currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!

    # URL : https://api.independentreserve.com/Public/GetMarketSummary?primaryCurrencyCode=xbt&secondaryCurrencyCode=usd

    #response:
    # {
    #     "DayHighestPrice": 7104.18,
    #     "DayLowestPrice": 6803.18,
    #     "DayAvgPrice": 6953.68,
    #     "DayVolumeXbt": 129.19338197,
    #     "DayVolumeXbtInSecondaryCurrrency": 3.44597449,
    #     "CurrentLowestOfferPrice": 7082.99,
    #     "CurrentHighestBidPrice": 6975.39,
    #     "LastPrice": 7023.04,
    #     "PrimaryCurrencyCode": "Xbt",
    #     "SecondaryCurrencyCode": "Usd",
    #     "CreatedTimestampUtc": "2018-08-29T04:11:07.6117517Z"
    # }

    # NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
    # bitcoin symbole and NOT BTC

    if @base_currency_code == 'BTC'
      bcc = 'XBT'
    else
      bcc = @base_currency_code
    end

    url = "https://api.independentreserve.com/Public/GetMarketSummary?primaryCurrencyCode=#{bcc.downcase}&secondaryCurrencyCode=#{@quote_currency_code.downcase}"
    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Buying BTC/USD => Ask price
    @buy_price = response["CurrentLowestOfferPrice"].to_f
  end

  def fetch_sell_price!

    if @base_currency_code == 'BTC'
      bcc = 'XBT'
    else
      bcc = @base_currency_code
    end

    url = "https://api.independentreserve.com/Public/GetMarketSummary?primaryCurrencyCode=#{bcc.downcase}&secondaryCurrencyCode=#{@quote_currency_code.downcase}"

    response = fetch_from_url(url)
    # TODO - Heandle exception of response here

    # when Selling BTC/USD => Bid price
    @sell_price = response["CurrentHighestBidPrice"].to_f
  end

  private

  def fetch_from_url(url)
    resopnse_seialized = open(url).read
    response_json = JSON.parse(resopnse_seialized)
    return response_json
  end

end

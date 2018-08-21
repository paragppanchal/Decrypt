require 'json'
require 'open-uri'

class CoinbaseExchange

  attr_accessor :base_currency_code, :currency_code, :buy_price, :sell_price

  def initialize(base_currency_code, currency_code = 'AUD')
    @base_currency_code = base_currency_code
    @currency_code = currency_code
    @buy_price = nil
    @sell_price = nil
  end

  def fetch_buy_price!
    url = "https://api.coinbase.com/v2/prices/#{@base_currency_code}-#{@currency_code}/buy"
    response = fetch_from_url(url)
    # returned hesh =>  e.g. {"data"=>{"base"=>"BTC", "currency"=>"AUD", "amount"=>"8673.35"}}
    # This means 1 BTC = 8673.35 AUD
    @buy_price = response["data"]["amount"].to_f
    # TODO - Hendal exception of response here
  end

  def fetch_sell_price!
    url = "https://api.coinbase.com/v2/prices/#{@base_currency_code}-#{@currency_code}/sell"
    # returned hesh =>  e.g. {"data"=>{"base"=>"BTC", "currency"=>"AUD", "amount"=>"8432.35"}}
    # This means 1 BTC = 8432.35 AUD
    response = fetch_from_url(url)
    @sell_price = response["data"]["amount"].to_f
  end

  private

  def fetch_from_url(url)
    resopnse_seialized = open(url).read
    response_json = JSON.parse(resopnse_seialized)
    return response_json
  end

end

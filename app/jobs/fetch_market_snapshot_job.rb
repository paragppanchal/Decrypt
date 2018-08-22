require_relative '../exchange-api/hitbtc_exchange'
require_relative '../exchange-api/cexio_exchange'
require_relative '../exchange-api/coinbase_exchange'
require_relative '../exchange-api/exmo_exchange'
require_relative '../exchange-api/itbit_exchange'

class FetchMarketSnapshotJob < ApplicationJob
  queue_as :default

  def perform(*args)

     # ------------- CEXIO Exchange ----------------
    cexio = CexioExchange.new('BTC', 'USD')

    cexio.fetch_buy_price!
    cexio.fetch_sell_price!

    # create exchange obj. instance

    # create base_coin obj. instance

    # create quote_coin obj. instance




    puts 'CEXIO Exchange'
    puts 'base Currency Code: ' + cexio.base_currency_code
    puts 'Currency Code: ' + cexio.quote_currency_code
    puts "Buy price: #{cexio.buy_price}"
    puts "Sell price: #{cexio.sell_price}"
    puts '-------------------------'

    # -------------- Coinbase Exchange ----------------
    cex = CoinbaseExchange.new('BTC', 'AUD')

    cex.fetch_buy_price!
    cex.fetch_sell_price!

    puts 'Coinbase Exchange'
    puts 'base Currency Code: ' + cex.base_currency_code
    puts 'Currency Code: ' + cex.quote_currency_code
    puts "Buy price: #{cex.buy_price}"
    puts "Sell price: #{cex.sell_price}"
    puts '-------------------------'

    # ------------- Exmo Exchange ---------------------
    exmo = ExmoExchange.new('BTC', 'USD')

    exmo.fetch_buy_price!
    exmo.fetch_sell_price!

    puts 'Exmo Exchange'
    puts 'base Currency Code: ' + exmo.base_currency_code
    puts 'Currency Code: ' + exmo.quote_currency_code
    puts "Buy price: #{exmo.buy_price}"
    puts "Sell price: #{exmo.sell_price}"
    puts '-------------------------'

    # -------------- HitBTC Exchange -------------
    hitbtc = HitbtcExchange.new('BTC', 'USD')
    hitbtc.fetch_buy_price!
    hitbtc.fetch_sell_price!

    puts 'HitBTC Exchange'
    puts 'base Currency Code: ' + hitbtc.base_currency_code
    puts 'Currency Code: ' + hitbtc.quote_currency_code
    puts "Buy price: #{hitbtc.buy_price}"
    puts "Sell price: #{hitbtc.sell_price}"
    puts '-------------------------'

    # --------------- ItBit Exchange ------------------
    # NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
    # bitcoin symbole and NOT BTC

    itbit = ItbitExchange.new('XBT', 'USD')

    itbit.fetch_buy_price!
    itbit.fetch_sell_price!

    puts 'ItBut Exchange'
    puts 'base Currency Code: ' + itbit.base_currency_code
    puts 'Currency Code: ' + itbit.quote_currency_code
    puts "Buy price: #{itbit.buy_price}"
    puts "Sell price: #{itbit.sell_price}"
    puts '-------------------------'

  end
end


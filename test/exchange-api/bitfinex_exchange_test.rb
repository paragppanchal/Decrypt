require_relative '../../app/exchange-api/bitfinex_exchange'

bitfin = BitfinexExchange.new('BTC', 'USD')

bitfin.fetch_buy_price!
bitfin.fetch_sell_price!

puts 'base Currency Code: ' + bitfin.base_currency_code
puts 'Currency Code: ' + bitfin.quote_currency_code
puts "Buy price: #{bitfin.buy_price}"
puts "Sell price: #{bitfin.sell_price}"

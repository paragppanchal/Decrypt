require_relative '../../app/exchange-api/exmo_exchange'

exmo = ExmoExchange.new('BTC', 'USD')

exmo.fetch_buy_price!
exmo.fetch_sell_price!

puts 'base Currency Code: ' + exmo.base_currency_code
puts 'Currency Code: ' + exmo.quote_currency_code
puts "Buy price: #{exmo.buy_price}"
puts "Sell price: #{exmo.sell_price}"

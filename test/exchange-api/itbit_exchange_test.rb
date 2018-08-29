require_relative '../../app/exchange-api/itbit_exchange'

itbit = ItbitExchange.new('BTC', 'USD')

itbit.fetch_buy_price!
itbit.fetch_sell_price!

puts 'base Currency Code: ' + itbit.base_currency_code
puts 'Currency Code: ' + itbit.quote_currency_code
puts "Buy price: #{itbit.buy_price}"
puts "Sell price: #{itbit.sell_price}"

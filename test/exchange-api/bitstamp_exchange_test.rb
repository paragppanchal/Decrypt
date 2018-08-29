require_relative '../../app/exchange-api/bitstamp_exchange'


bitstamp = BitstampExchange.new('BTC', 'USD')

bitstamp.fetch_buy_price!
bitstamp.fetch_sell_price!

puts 'base Currency Code: ' + bitstamp.base_currency_code
puts 'Currency Code: ' + bitstamp.quote_currency_code
puts "Buy price: #{bitstamp.buy_price}"
puts "Sell price: #{bitstamp.sell_price}"

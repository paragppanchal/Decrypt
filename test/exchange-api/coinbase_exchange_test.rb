require_relative '../../app/exchange-api/coinbase_exchange'

cex = CoinbaseExchange.new('BTC', 'AUD')

cex.fetch_buy_price!
cex.fetch_sell_price!

puts 'base Currency Code: ' + cex.base_currency_code
puts 'Currency Code: ' + cex.currency_code
puts "Buy price: #{cex.buy_price}"
puts "Sell price: #{cex.sell_price}"


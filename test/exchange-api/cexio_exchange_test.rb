require_relative '../../app/exchange-api/cexio_exchange'

cexio = CexioExchange.new('BTC', 'USD')

cexio.fetch_buy_price!
cexio.fetch_sell_price!

puts 'base Currency Code: ' + cexio.base_currency_code
puts 'Currency Code: ' + cexio.quote_currency_code
puts "Buy price: #{cexio.buy_price}"
puts "Sell price: #{cexio.sell_price}"

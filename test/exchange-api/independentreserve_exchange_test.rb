require_relative '../../app/exchange-api/independentreserve_exchange'

indres = IndependentreserveExchange.new('BTC', 'USD')

indres.fetch_buy_price!
indres.fetch_sell_price!

puts 'base Currency Code: ' + indres.base_currency_code
puts 'Currency Code: ' + indres.quote_currency_code
puts "Buy price: #{indres.buy_price}"
puts "Sell price: #{indres.sell_price}"

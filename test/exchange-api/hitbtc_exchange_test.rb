require_relative '../../app/exchange-api/hitbtc_exchange'

hitbtc = HitbtcExchange.new('BTC', 'USD')

hitbtc.fetch_buy_price!
hitbtc.fetch_sell_price!

puts 'base Currency Code: ' + hitbtc.base_currency_code
puts 'Currency Code: ' + hitbtc.quote_currency_code
puts "Buy price: #{hitbtc.buy_price}"
puts "Sell price: #{hitbtc.sell_price}"

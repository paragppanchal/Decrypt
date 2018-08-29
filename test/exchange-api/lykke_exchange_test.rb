require_relative '../../app/exchange-api/lykke_exchange'

lykke = LykkeExchange.new('BTC', 'USD')

lykke.fetch_buy_price!
lykke.fetch_sell_price!

puts 'base Currency Code: ' + lykke.base_currency_code
puts 'Currency Code: ' + lykke.quote_currency_code
puts "Buy price: #{lykke.buy_price}"
puts "Sell price: #{lykke.sell_price}"

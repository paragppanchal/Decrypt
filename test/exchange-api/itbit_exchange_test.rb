require_relative '../../app/exchange-api/itbit_exchange'

# NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
# bitcoin symbole and NOT BTC

itbit = ItbitExchange.new('XBT', 'USD')

itbit.fetch_buy_price!
itbit.fetch_sell_price!

puts 'base Currency Code: ' + itbit.base_currency_code
puts 'Currency Code: ' + itbit.quote_currency_code
puts "Buy price: #{itbit.buy_price}"
puts "Sell price: #{itbit.sell_price}"

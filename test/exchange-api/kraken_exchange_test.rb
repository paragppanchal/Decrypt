require_relative '../../app/exchange-api/kraken_exchange'

# NOTE: tickerSymbol  -> always pass XBT for bitcoin. this exchange excepts XBT as
# bitcoin symbole and NOT BTC

kraken = KrakenExchange.new('BTC', 'USD')

kraken.fetch_buy_price!
kraken.fetch_sell_price!

puts 'base Currency Code: ' + kraken.base_currency_code
puts 'Currency Code: ' + kraken.quote_currency_code
puts "Buy price: #{kraken.buy_price}"
puts "Sell price: #{kraken.sell_price}"

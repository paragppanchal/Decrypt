class FetchMarketSnapshotJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # fetch current buy & sell price of all the exchanges on the Exchanges table
    all_exchanges = Exchange.all
    all_exchanges.each do |exchange|
      begin
        update_market_snashot_record(exchange, 'BTC', 'USD')
      # this will not raise any exception if exchange api call fails.
      # it will log the excption though
      rescue Exception => e
        p e
      end
    end
  end

  private

  def update_market_snashot_record(exchange, base_currency_code, quote_currency_code)

    case exchange.name
    when "cexio"
      fetched_exchange = CexioExchange.new('BTC', 'USD')
    when "coinbase"
      fetched_exchange = CoinbaseExchange.new('BTC', 'USD')
    when "exmo"
      fetched_exchange = ExmoExchange.new('BTC', 'USD')
    when "hitbtc"
      fetched_exchange = HitbtcExchange.new('BTC', 'USD')
    when "itbit"
      fetched_exchange = ItbitExchange.new('BTC', 'USD')
    else
      puts 'exchange not found...'
    end
    #fetch current buy and sell price of the exchange
    fetched_exchange.fetch_buy_price!
    fetched_exchange.fetch_sell_price!

    # create exchange obj. instance
    #exchange = Exchange.find_by(name: exchange.name)
    # create base_coin obj. instance
    base_coin = Coin.find_by(currency_code: fetched_exchange.base_currency_code)
    # create quote_coin obj. instance
    quote_coin = Coin.find_by(currency_code: fetched_exchange.quote_currency_code)

    #check if record already exists then update it or else create a new one.
    if MarketSnapshot.where(exchange: exchange, base_coin: base_coin, quote_coin: quote_coin).exists?
      # record already exists so update buy and sell prices
      market_snapshot_record = MarketSnapshot.find_by(exchange: exchange, base_coin: base_coin, quote_coin: quote_coin)
      market_snapshot_record.buy_price = fetched_exchange.buy_price
      market_snapshot_record.sell_price = fetched_exchange.sell_price
      market_snapshot_record.save!
    else
      # didn't find record so create new here
      market_snapshot_record = MarketSnapshot.new
      market_snapshot_record.exchange = exchange
      market_snapshot_record.base_coin = base_coin
      market_snapshot_record.quote_coin = quote_coin
      market_snapshot_record.buy_price = fetched_exchange.buy_price
      market_snapshot_record.sell_price = fetched_exchange.sell_price
      market_snapshot_record.save!
    end
    puts  "#{exchange.name} Exchange"
    puts 'base Currency Code: ' + fetched_exchange.base_currency_code
    puts 'Currency Code: ' + fetched_exchange.quote_currency_code
    puts "Buy price: #{fetched_exchange.buy_price}"
    puts "Sell price: #{fetched_exchange.sell_price}"
    puts '-------------------------'
  end
end


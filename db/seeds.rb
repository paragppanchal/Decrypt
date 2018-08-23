# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  puts 'Creating all the exchanges...'

  MarketSnapshot.destroy_all
  Coin.destroy_all
  Exchange.destroy_all

  exchange = Exchange.new
  exchange.name = 'cexio'
  exchange.save!

  exchange = Exchange.new
  exchange.name = 'coinbase'
  exchange.save!

  exchange = Exchange.new
  exchange.name = 'exmo'
  exchange.save!

  exchange = Exchange.new
  exchange.name = 'hitbtc'
  exchange.save!

  exchange = Exchange.new
  exchange.name = 'itbit'
  exchange.save!


  puts "Createing all the coins..."

  coin = Coin.new
  coin.name = "BitCoin"
  coin.currency_code = "BTC"
  coin.save!

  coin = Coin.new
  coin.name = "US Dollars"
  coin.currency_code = "USD"
  coin.save!
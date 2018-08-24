# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  def exchange_record(attributes = {})
    exchange = Exchange.new
    exchange.name = attributes[:name]
    exchange.country = attributes[:country]
    exchange.verification_time = attributes[:verification_time]
    exchange.ease_of_use = attributes[:ease_of_use]
    exchange.fee_description = attributes[:fee_description]
    exchange.fees = attributes[:fees]
    exchange.rating = attributes[:rating]
    exchange.payout_methods = attributes[:payout_methods]
    exchange.payment_methods = attributes[:payment_methods]
    exchange.available_in_au = attributes[:available_in_au]
    exchange.beginner_friendly = attributes[:beginner_friendly]
    exchange.integrated_wallet = attributes[:integrated_wallet]
    exchange.two_factor_auth = attributes[:two_factor_auth]
    exchange.cold_storage = attributes[:cold_storage]
    exchange.multisig_wallets = attributes[:multisig_wallets]
    exchange.save!
  end

  puts 'Creating all the exchanges...'

  MarketSnapshot.destroy_all
  Coin.destroy_all
  Exchange.destroy_all

  exchange_record(  name: 'cexio',
                    country: 'United Kingdom',
                    verification_time: '> 1 week',
                    ease_of_use: 'Average',
                    fee_description: "Includes 7% instant trade fee. Addition fees apply based on payment method.",
                    fees: "Very High",
                    rating: 5,
                    payout_methods: ['SWIFT Bank Transfer', 'SEPA Bank Transfer', 'VISA', 'Mastercard'],
                    payment_methods: ['SWIFT Bank Transfer', 'SEPA Bank Transfer', 'VISA', 'Mastercard'],
                    available_in_au: true,
                    beginner_friendly: false,
                    integrated_wallet: true,
                    two_factor_auth: true,
                    cold_storage: true,
                    multisig_wallets: true
                  )


  exchange_record(  name: 'coinbase',
                    country: 'United States',
                    verification_time: '< 1 Hour',
                    ease_of_use: 'Excellent',
                    fee_description: "Includes 1.49% fee. Additional fees apply based on payment method.",
                    fees: "Medium",
                    rating: 5,
                    payout_methods: ['SWIFT Bank Transfer', 'Paypal'],
                    payment_methods: ['SWIFT Bank Transfer', 'SEPA Bank Transfer', 'VISA', 'Mastercard', 'iDeal'],
                    available_in_au: true,
                    beginner_friendly: true,
                    integrated_wallet: true,
                    two_factor_auth: true,
                    cold_storage: true,
                    multisig_wallets: true
                  )

  exchange_record(  name: 'exmo',
                    country: 'United Kingdom',
                    verification_time: '< 1 Week',
                    ease_of_use: 'Good',
                    fee_description: "Price includes 0.20% trading fee. Addition fees apply based on payment method.",
                    fees: "High",
                    rating: 4,
                    payout_methods: ['SWIFT Bank Transfer', 'SEPA bank Transfer'],
                    payment_methods: ['SWIFT Bank Transfer', 'SEPA Bank Transfer', 'Skrill'],
                    available_in_au: true,
                    beginner_friendly: false,
                    integrated_wallet: true,
                    two_factor_auth: true,
                    cold_storage: true,
                    multisig_wallets: false
                  )

  exchange_record(  name: 'hitbtc',
                    country: 'Hong Kong',
                    verification_time: '> 1 Week',
                    ease_of_use: 'Average',
                    fee_description: "Price includes 0.10% trading fee. HitBTC does not specify deposit/withdrawal fees which may occur in addition to trading fees.",
                    fees: "Low",
                    rating: 3,
                    payout_methods: ['SWIFT Bank Transfer', 'Paypal'],
                    payment_methods: ['SWIFT Bank Transfer'],
                    available_in_au: true,
                    beginner_friendly: false,
                    integrated_wallet: true,
                    two_factor_auth: true,
                    cold_storage: true,
                    multisig_wallets: false
                  )

  exchange_record(  name: 'itbtc',
                    country: 'Singapore',
                    verification_time: '> 1 Week',
                    ease_of_use: 'Average',
                    fee_description: "Price includes 0.20% taker/maker fee. Depending on volume and trade type this fee might be lower. Addition fees apply based on payment method.",
                    fees: "Low",
                    rating: 2,
                    payout_methods: ['SWIFT Bank Transfer', 'SEPA Bank Transfer'],
                    payment_methods: ['SWIFT Bank Transfer', 'SEPA Bnak Transfer'],
                    available_in_au: true,
                    beginner_friendly: false,
                    integrated_wallet: true,
                    two_factor_auth: true,
                    cold_storage: true,
                    multisig_wallets: true
                  )

  puts "Creating all the coins..."

  coin = Coin.new
  coin.name = "BitCoin"
  coin.currency_code = "BTC"
  coin.save!

  coin = Coin.new
  coin.name = "US Dollars"
  coin.currency_code = "USD"
  coin.save!


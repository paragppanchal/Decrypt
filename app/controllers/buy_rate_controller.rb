class BuyRateController < ApplicationController

  def bitcoin
    @base_coin = Coin.find_by(currency_code: 'BTC')
    @quote_coin = Coin.find_by(currency_code: 'USD')
    @market_snapshots = MarketSnapshot.where(base_coin: @base_coin, quote_coin: @quote_coin)

    if params[:amount].blank?
      query_amount = 1.0
    else
      query_amount = params[:amount].to_f
    end

    payment_methods_filter = params[:payment_methods]
    features_filter = params[:features]
    security_filter = params[:security]

    @filtered_exchanges = filter_exchanges( @market_snapshots, query_amount,
                                            sort_order: 'ASC',
                                            payment_methods: payment_methods_filter,
                                            features: features_filter,
                                            security: security_filter
                                          )
  end

  # private

  def filter_exchanges(market_snapshots, q_amt, filters={})
    # Filter
    mkt_snapshots_filtered = []
    market_snapshots.each do |ms|
      if ( payment_methods_include_this_exchange?(ms.exchange, filters[:payment_methods]) &&
           features_include_this_exchange?(ms.exchange, filters[:features]) &&
           security_include_this_exchange?(ms.exchange, filters[:security])
         )
        mkt_snapshots_filtered << ms
      end
    end
    # Sort : Ascending (default) or Descanding order
    # by default sort by ascending order, if it's not set on the filters hash
    if filters[:sort_order] == 'DESC'
      mkt_snapshots_filtered_sorted = mkt_snapshots_filtered.sort_by {|e| -e[:buy_price]}  #DESC sort
    else
      mkt_snapshots_filtered_sorted = mkt_snapshots_filtered.sort_by {|e| e[:buy_price]}  #ASC sort
    end

    f_exchanges = []
    mkt_snapshots_filtered_sorted.each do |market_snapshot|
      bitcoin = q_amt / market_snapshot.buy_price
      exchange = market_snapshot.exchange
      f_exchanges << { market_snapshot: market_snapshot,
                       exchange: exchange,
                       bitcoin: bitcoin
                     }
    end
    return f_exchanges
  end

  def payment_methods_include_this_exchange?(exchange, payment_methods_filter)
    # output: return true if the any of the element in the payment_methods_filter array
    # is available in the exchange payment methods array.
    if payment_methods_filter.nil?
      return false
    end

    payment_methods_filter.each do |fm|
      if exchange.payment_methods.include?(fm)
        return true
      end
    end
    return false
  end

  def features_include_this_exchange?(exchange, features_filter)
    # output: return true if all the feautures filter is supported feature of an exchange
    if features_filter.nil?
      return true
    end
    puts features_filter
    check_pass_count = 0
    target_check_count = features_filter.length
    features_filter.each do |f|
      if ((f == 'Beginner Friendly') && exchange.beginner_friendly)
        check_pass_count += 1
      elsif ((f == 'Instant Verification') && exchange.verification_time == '< 1 Hour')
        check_pass_count += 1
      elsif ((f == 'Integrated Wallet') && exchange.integrated_wallet)
        check_pass_count += 1
      end
    end
    # return true if all the feature filter check passed
    return check_pass_count == target_check_count
  end

  def security_include_this_exchange?(exchange, security_filter)
    #output: return true if all elements in the security_filter array are supported security
    # features of an exchange

    if security_filter.nil?
      return true
    end

    check_pass_count = 0
    target_check_count = security_filter.length
    security_filter.each do |f|
      if ((f == 'Two-factor Authentication') && exchange.two_factor_auth)
        check_pass_count += 1
      elsif ((f == 'Cold Storage') && exchange.cold_storage)
        check_pass_count += 1
      elsif ((f == 'Multisig Wallets') && exchange.multisig_wallets)
        check_pass_count += 1
      end
    end
    return check_pass_count == target_check_count
  end
end

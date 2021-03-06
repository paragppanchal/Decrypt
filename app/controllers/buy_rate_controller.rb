class BuyRateController < ApplicationController

  def bitcoin
    # fetch market shapshot records with matching base currency and quote currency
    # It's hard coaded to look for BTC/USD at the moment but we need to change the
    # at later stage then we support multiple currencies
    @base_coin = Coin.find_by(currency_code: 'BTC')
    @quote_coin = Coin.find_by(currency_code: 'USD')
    @market_snapshots = MarketSnapshot.where(base_coin: @base_coin, quote_coin: @quote_coin)

    # if user didn't enter any amount then use default query_amount.
    # TODO - validate the amount is integer
    if params[:amount].blank?
      query_amount = 1.0
    else
      query_amount = params[:amount].to_f
    end

    params[:payment_methods] ||= [
      "SWIFT Bank Transfer",
      "SEPA Bank Transfer",
      "Mastercard",
      "VISA",
      "Paypal",
      "Sofort",
      "Giropay",
      "Skrill",
      "iDeal",
      "Bancontact / Mister"
    ]
    params[:features] ||= []
    params[:security] ||= []

    # get the filter settings from the view
    payment_methods_filter = params[:payment_methods]
    features_filter = params[:features]
    security_filter = params[:security]

    # filter the exchanges based on the filters
    @filtered_exchanges = filter_exchanges( @market_snapshots, query_amount,
                                            sort_order: 'ASC',
                                            payment_methods: payment_methods_filter,
                                            features: features_filter,
                                            security: security_filter
                                          )

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def filter_exchanges(market_snapshots, q_amt, filters={})

    # ----- Filter ------
    # Filter exchange based on payment methods, features and security filter
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
    # compute bitcoin and populate the array we want to return
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
      return true
    end
    # if any of the payment method is supported by the exchange then
    # include that exchange.
    payment_methods_filter.each do |fm|
      if exchange.payment_methods.include?(fm)
        return true
      end
    end
    return false
  end

  def features_include_this_exchange?(exchange, features_filter)
    # output: return true if all elements on the the feautures filter array are
    # supported feature of an exchange

    # select the exchange if no feature is been selected
    if features_filter.nil?
      return true
    end
    # check if all the features on the filter are supported by the exchange
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

    # select the exchange if no security filter is been selected
    if security_filter.nil?
      return true
    end

    #check if all the features on the filter are supported by the exchange
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

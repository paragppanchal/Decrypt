class ChangePriceColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :exchange_coins, :live_price
    add_column  :exchange_coins, :buy_price, :float
    add_column :exchange_coins, :sell_price, :float
  end

end

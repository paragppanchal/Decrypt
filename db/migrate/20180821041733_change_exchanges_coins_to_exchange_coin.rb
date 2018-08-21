class ChangeExchangesCoinsToExchangeCoin < ActiveRecord::Migration[5.2]
  def change
    rename_table :exchanges_coins, :exchange_coins
  end
end

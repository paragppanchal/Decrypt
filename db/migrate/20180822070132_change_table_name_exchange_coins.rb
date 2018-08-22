class ChangeTableNameExchangeCoins < ActiveRecord::Migration[5.2]
  def change
    rename_table :exchange_coins, :market_snapshots
  end
end

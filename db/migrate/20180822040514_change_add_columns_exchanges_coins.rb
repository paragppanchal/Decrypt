class ChangeAddColumnsExchangesCoins < ActiveRecord::Migration[5.2]
  def change
    rename_column :exchange_coins, :coin_id, :base_coin_id
    add_column :exchange_coins, :quote_coin_id, :integer
  end
end

class CreateExchangesCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges_coins do |t|
      t.references :exchange, foreign_key: true
      t.references :coin, foreign_key: true
      t.integer :live_price
      t.datetime :last_updated

      t.timestamps
    end
  end
end

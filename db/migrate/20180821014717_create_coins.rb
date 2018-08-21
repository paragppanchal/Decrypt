class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :currency_code

      t.timestamps
    end
  end
end

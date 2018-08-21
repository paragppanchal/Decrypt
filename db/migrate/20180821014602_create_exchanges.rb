class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :country
      t.integer :verification_time
      t.string :fee_description
      t.string :fee
      t.integer :rating

      t.timestamps
    end
  end
end

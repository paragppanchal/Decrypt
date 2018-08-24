class ChangeExchangeTable < ActiveRecord::Migration[5.2]
  def change
    change_column :exchanges, :verification_time, :string, :default => '', :null => false
    rename_column :exchanges, :paymnt_methods, :payment_methods
    add_column :exchanges, :ease_of_use, :string, :default => '', :null => false
    rename_column :exchanges, :fee, :fees
  end
end

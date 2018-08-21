class AddPayoutMethodsToExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :exchanges, :payout_methods, :json
  end
end

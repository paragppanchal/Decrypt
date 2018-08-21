class AddManyColumnsToExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :exchanges, :paymnt_methods, :json
    add_column :exchanges, :available_in_au, :json
    add_column :exchanges, :beginner_friendly, :json
    add_column :exchanges, :integrated_wallet, :json
    add_column :exchanges, :two_factor_auth, :json
    add_column :exchanges, :cold_storage, :json
    add_column :exchanges, :multisig_wallets, :json
  end
end

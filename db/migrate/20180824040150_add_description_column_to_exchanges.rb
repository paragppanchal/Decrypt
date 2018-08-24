class AddDescriptionColumnToExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column :exchanges, :description, :text
  end
end

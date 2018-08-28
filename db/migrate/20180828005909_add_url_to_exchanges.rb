class AddUrlToExchanges < ActiveRecord::Migration[5.2]
  def change
    add_column  :exchanges, :url, :string
  end
end

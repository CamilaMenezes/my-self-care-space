class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Address, :string
  end
end

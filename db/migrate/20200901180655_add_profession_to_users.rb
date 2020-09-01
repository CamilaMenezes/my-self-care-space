class AddProfessionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Profession, :string
  end
end

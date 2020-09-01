class RenameProfessionToProfession < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :Profession, :profession
  end
end

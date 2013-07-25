class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :professionals, :remember_token, :remember_token_professional
  end

  def down
  end
end

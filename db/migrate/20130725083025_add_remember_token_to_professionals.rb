class AddRememberTokenToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :remember_token, :string
    add_index  :professionals, :remember_token

  end
end

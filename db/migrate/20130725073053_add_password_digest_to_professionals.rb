class AddPasswordDigestToProfessionals < ActiveRecord::Migration
  def change
    add_column :professionals, :password_digest, :string
  end
end

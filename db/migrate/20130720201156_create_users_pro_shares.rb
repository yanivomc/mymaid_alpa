class CreateUsersProShares < ActiveRecord::Migration
  def change
    create_table :users_pro_shares do |t|
      t.integer  :user_id
      t.integer  :professional_id

      t.timestamps
    end
    add_index :users_pro_shares, :user_id
    add_index :users_pro_shares, :professional_id
    add_index :users_pro_shares, [:user_id, :professional_id], unique: true
  end
end



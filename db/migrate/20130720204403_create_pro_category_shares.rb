class CreateProCategoryShares < ActiveRecord::Migration
  def change
    create_table :pro_category_shares do |t|
      t.integer :procategory_id
      t.integer :category_id

      t.timestamps
    end
    add_index :pro_category_shares, :procategory_id
    add_index :pro_category_shares, :category_id
    add_index :pro_category_shares, [:procategory_id, :category_id], unique: true
  end
end

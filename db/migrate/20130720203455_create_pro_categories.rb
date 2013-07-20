class CreateProCategories < ActiveRecord::Migration
  def change
    create_table :pro_categories do |t|
      t.string :profession
      t.string :description


      t.timestamps
    end
    add_index :pro_categories, :profession, unique: true
  end
end

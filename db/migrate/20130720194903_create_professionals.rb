class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.string :email
      t.string :state
      t.string :zipcode
      t.string :address
      t.string :profession
      t.string :birthday_month
      t.integer :birthday_day
      t.integer :birthday_year
      t.timestamps
    end
    add_index :professionals, :email, unique: true
    add_index :professionals, :first_name
    add_index :professionals, :last_name
    add_index :professionals, :profession

  end
end

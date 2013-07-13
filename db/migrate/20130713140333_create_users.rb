class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :birthday_month
      t.integer :birthday_day
      t.integer :birthday_year

      t.timestamps
    end
  end
end

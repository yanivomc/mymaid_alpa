class CreateBookmes < ActiveRecord::Migration
  def change
    create_table :bookmes do |t|
        t.string :title
        t.boolean :allDay
        t.timestamps :start
        t.timestamps :end
        t.string :url
        t.string :className
        t.boolean :editable
        t.string :color
        t.string :backgroundColor
        t.string :borderColor
        t.string :textColor
        t.string :book_user_id
        t.string :book_pro_id

      t.timestamps
    end
  end
end

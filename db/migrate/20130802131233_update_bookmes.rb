class UpdateBookmes < ActiveRecord::Migration
  def change
    add_column :bookmes, :start, :date
    add_column :bookmes, :end, :date
  end
end

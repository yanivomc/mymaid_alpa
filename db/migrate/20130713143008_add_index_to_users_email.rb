class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # Add index to the email (which will be our username lookup) and add a unique = true to the field as this is
    # the Username and require to be unique.
    add_index :users, :email, unique: true

  end
end

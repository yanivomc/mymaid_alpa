class AddFacevariablesToUsers < ActiveRecord::Migration
  def change

    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :image_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :location , :string
    add_column :users, :timezone  , :string
    add_column :users, :locale   , :string


    add_column :professionals, :provider, :string
    add_column :professionals, :oauth_token, :string
    add_column :professionals, :oauth_expires_at, :datetime
    add_column :professionals, :uid, :string
    add_column :professionals, :name, :string
    add_column :professionals, :image_url, :string
    add_column :professionals, :facebook_url, :string
    add_column :professionals, :location , :string
    add_column :professionals, :timezone  , :string
    add_column :professionals, :locale   , :string



  end
end
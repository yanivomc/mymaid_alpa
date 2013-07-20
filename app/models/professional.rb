class Professional < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :lastname, :profession, :state, :zipcode
  has_many :users_pro_shares, foreign_key: "professional_id"  , dependent: :destroy
  has_many :pro_category_shares, foreign_key: "procategory_id"  , dependent: :destroy
  has_many :hired_customers, through: :users_pro_shares, source: :user


end

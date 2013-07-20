class ProCategory < ActiveRecord::Base
  attr_accessible :description, :type
  has_many :pro_category_share, foreign_key: "category_id"  , dependent: :destroy

end

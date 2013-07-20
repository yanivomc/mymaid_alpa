class ProCategoryShare < ActiveRecord::Base
  attr_accessible :category_id, :procategory_id
  #belongs_to :user, class_name: "User"
  belongs_to :procategory, class_name: "Professional"
  belongs_to :category, class_name: "ProCategory"

  validates :category, presence: true
  validates :procategory, presence: true


end

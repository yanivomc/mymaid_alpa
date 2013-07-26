class UsersProShare < ActiveRecord::Base
  attr_accessible :professional_id, :user_id
  belongs_to :user, class_name: "User"
  belongs_to :professional, class_name: "Professional"

  validates :user, presence: true
  validates :professional, presence: true



end

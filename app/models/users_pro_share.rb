class UsersProShare < ActiveRecord::Base
  attr_accessible :professional_id, :user_id
  belongs_to :user, class_name: "User"
  belongs_to :professional, class_name: "Professional"

  validates :user, presence: true
  validates :professional, presence: true

def create
  @users_pro_shares = current_user_professional.users_pro_share.build

end

end

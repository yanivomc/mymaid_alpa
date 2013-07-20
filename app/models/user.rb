# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  birthday_month  :string(255)
#  birthday_day    :integer
#  birthday_year   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :birthday_day, :birthday_month, :birthday_year, :email, :first_name, :last_name , :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  # Adding a before_Save to make sure that before a user save/update his information, we will create a new
  # Token (Base64) and store it in the DB and then in a cookie for the user session control
  before_save :create_remember_token

  #DB Relationships
  has_many :users_pro_shares, foreign_key: "user_id"  , dependent: :destroy
  has_many :hired_professionals, through: :users_pro_shares, source: :professional

  # Adding validation to all of the above
  # validates :birthday_day, presence: true
  #validates :birthday_month, presence: true
  #validates :birthday_year, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },  uniqueness: { case_sensitive: false }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end



end

class Professional < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :profession, :state, :zipcode , :password, :password_confirmation
  has_secure_password
  #Adding a before_Save to make sure that before a user save/update his information, we will create a new
  # Token (Base64) and store it in the DB and then in a cookie for the user session control
  before_save :create_remember_token

  has_many :users_pro_shares, foreign_key: "professional_id"  , dependent: :destroy
  has_many :pro_category_shares, foreign_key: "procategory_id"  , dependent: :destroy
  has_many :hired_customers, through: :users_pro_shares, source: :user

  validate :password, presence: true, length: { minimum: 6 }
  validate :password_confirmation, presence: true

  def hire?(this_professional)
    users_pro_shares.find_by(user_id: this_professional.id)

  end

  def hire!(this_professional)
    users_pro_shares.create!(user_id: this_professional.id)
  end

  def unhire!(this_professional)
    #users_pro_shares.find_by(user_id: this_professional.id).destroy
    users_pro_shares.find_by(user_id: this_professional.id).destroy

  end




  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64

  end





end

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
  attr_accessible :birthday_day, :birthday_month, :birthday_year, :email, :first_name, :last_name , :password, :password_confirmation, :provider, :oauth_token, :oauth_expires_at, :uid, :name, :image_url, :facebook_url, :location, :timezone, :locale
  has_secure_password

  before_save { |user| user.email = email.downcase }
  # Adding a before_Save to make sure that before a user save/update his information, we will create a new
  # Token (Base64) and store it in the DB and then in a cookie for the user session control
  before_save :create_remember_token

  #DB Relationships
  # Connection by User_id - Search Professional hired by user_id
  has_many :users_pro_shares, foreign_key: "user_id"  , dependent: :destroy
  # Connection by professional_id (reverse)- Search Users by Professional_id (Which users a professional has worked for)
  has_many :reverse_users_pro_shares, foreign_key: "professional_id" , class_name: "UsersProShare",
                                                                       dependent:   :destroy

  # Add new column to the table with the name: Hired_pro and Users_hired base on the ABOVE relationships
  has_many :hired_professionals, through: :users_pro_shares, source: :professional
  has_many :users_hired,  through:  :reverse_users_pro_shares, source: :professional







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


    # Check if a user has hired this professional
    def add_pro_hired?(pro_user)
      users_pro_shares.find_by_professional_id(pro_user.id)
    end

    # Check if a user has added this Professional to his favorite list
    def add_pro_favorite?(pro_user)
      # Add a tasks to search in a favorite DB table
    end

    def add_pro_hired!(pro_user)
    users_pro_shares.create[professional_id: pro_user.id]

    end


  def add_pro_favorite!(pro_user)
    # Add a tasks to add pro to the favorite DB table
  end

  def remove_pro_hired!(pro_user)
    #When removing an hired professional, we will also remove him from the favorite list IF he was added to that list
    users_pro_shares.find_by_professional_id(pro_user.id).destroy
    # users_pro_favorite.find_by_professional_id(pro_user.id).destroy
  end








  # /////////////  New testing Relationship table ///////////////
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy


  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  #//////////////////// Facebook omniauth

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.first_name = auth.first_name
      user.last_name  = auth.last_name
      user.email = auth.email
      user.image_url  = auth.image
      user.facebook_url = auth.image
      user.oauth_token = auth.credentials.token
      self.remember_token =  auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64

      end







end

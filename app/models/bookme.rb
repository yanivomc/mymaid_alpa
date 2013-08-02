class Bookme < ActiveRecord::Base
  belongs_to :professional
  belongs_to :user
  # attr_accessible :title, :body

end

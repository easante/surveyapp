class Moderator < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :password, :presence => true, :length => { :minimum => 6 }

end

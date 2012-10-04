class User < ActiveRecord::Base
  has_many :answers
  has_many :questionnaires, :through => :answers
  attr_accessible :age, :gender, :ip_address, :occupation, :population, :region

  validates :age, :gender, :occupation, :population, :region, :presence => true

end

class User < ActiveRecord::Base
  has_many :services
  
  attr_accessible :fullname, :nickname, :email

end


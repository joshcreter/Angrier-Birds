class Channel < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  
  attr_accessible :id, :name
end
class User < ActiveRecord::Base
  has_many :lists, :dependent  => :destroy
  
  authenticates_with_sorcery!
  
  
  attr_accessible :email, :password

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end

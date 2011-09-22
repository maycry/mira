class List < ActiveRecord::Base
  has_many :items, :dependent  => :destroy
  belongs_to :user
  
  attr_accessible :name, :visible
end

class Item < ActiveRecord::Base
  belongs_to :list, :include => :user
  
  attr_accessible :content, :visible, :list_id
end

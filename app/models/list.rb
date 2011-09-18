class List < ActiveRecord::Base
  has_many :items, :dependent  => :destroy
  belongs_to :user
  has_paper_trail
end

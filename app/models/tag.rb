class Tag < ActiveRecord::Base
  has_many :joins
  has_many :posts, :through => :joins
end

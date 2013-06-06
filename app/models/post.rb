class Post < ActiveRecord::Base
  has_many :joins
  has_many :tags, :through => :joins

end

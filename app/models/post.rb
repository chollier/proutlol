class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :shares
  
  has_permalink :title
  
  def to_param
    permalink
  end
end

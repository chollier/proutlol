class User < ActiveRecord::Base
  acts_as_authentic
  has_many :posts
  
  def is_admin?
    if self.admin
      return true
    else
      return false
    end
  end
  
end

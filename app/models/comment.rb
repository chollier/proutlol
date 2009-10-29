class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :name, :on => :create, :message => "ne peut être vide"
  validates_presence_of :content, :on => :create, :message => "ne peut être vide"
  validates_presence_of :post_id, :on => :create, :message => "erreur"
end

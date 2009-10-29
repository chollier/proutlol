class ShareController < ApplicationController
  
  def twitter
    
    @post = Post.find(params[:id])
    
    log = Share.new
    log.type = 0
    log.created_at = Time.now rescue nil
    log.creator_id = current_user.id rescue nil
    log.post_id = @post.id
    log.save!
    
    
    redirect_to "http://twitter.com/home?status=En train de lire : " + \
                "#{permalink_url(@post)}"
  end

  def facebook
    
    @post = Post.find(params[:id])
    
    log = Share.new    

    log.type = 1
    log.created_at = Time.now rescue nil
    log.creator_id = current_user.id rescue nil
    log.post_id = @post.id
    log.save!
    render :text => ""
  end

  
end

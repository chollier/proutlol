module ShareHelper

  def twitter_share(post)
    return link_to(image_tag('twittershare.png', :alt => "partage twitter"), {:controller => "share", :action => "twitter", :id => post.id}, { :title => "Cliquer pour partager cette question sur Twitter.", :rel => "nofollow" })
  end
  

  def facebook_share(post)
    return "<script type=\"text/javascript\">function fbs_click_#{post.class}_#{post.id}() {u=\"#{permalink_url(post)}\";t=#{post.title ? "\"#{post.title}\"" : "document.title"};window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');return false;}</script>#{link_to_remote '<img src="/images/facebook.png" height="16px" width="16px" alt="partage facebook"/>', :url => { :controller => 'share', :action => 'facebook', :id => post.id }, :complete => "fbs_click_#{post.class}_#{post.id}();", :html => { :title => "Cliquer pour partager cet article sur Facebook.", :rel => "nofollow" } }</a>"
  end
  
end

class CommentsController < ApplicationController


  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    
    @comment.post_id = Post.find_by_permalink(params[:post_id]).id
    
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
          format.html { 
            flash[:notice] = 'Votre commentaire a bien été posté'
            redirect_to(permalink_path(@comment.post))
          }
          format.js
          format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to(permalink_path(@comment.post)) }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

end

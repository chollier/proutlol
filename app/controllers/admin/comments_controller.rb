class Admin::CommentsController < ApplicationController
    before_filter :require_admin


    # GET /comments
    # GET /comments.xml
    def index
      @comments = Comment.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @comments }
      end
    end

    # GET /comments/1
    # GET /comments/1.xml
    def show
      @comment = Comment.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @comment }
      end
    end

    # GET /comments/new
    # GET /comments/new.xml
    def new
      @comment = Comment.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @comment }
      end
    end

    # GET /comments/1/edit
    def edit
      @comment = Comment.find(params[:id])
    end

    # POST /comments
    # POST /comments.xml
    def create
      @comment = Comment.new(params[:comment])

      @comment.post_id = Post.find_by_permalink(params[:post_id])

      @comment.user = current_user

      respond_to do |format|
        if @comment.save
          if request.xhr?
            format.html {
            render :update do |page|
              page.insert_html :bottom, "new_comment_receiver", {:partial => "comment_added", :object => @comment, :as => :comment}
              page.visual_effect :toggle_appear, "comment-#{@comment.id}", :duration => 1
            end
          }
          else
            flash[:notice] = 'Comment was successfully created.'
            format.html { redirect_to(@comment) }
            format.xml  { render :xml => @comment, :status => :created, :location => @comment }
          end
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /comments/1
    # PUT /comments/1.xml
    def update
      @comment = Comment.find(params[:id])

      respond_to do |format|
        if @comment.update_attributes(params[:comment])
          flash[:notice] = 'Comment was successfully updated.'
          format.html { redirect_to(@comment) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /comments/1
    # DELETE /comments/1.xml
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to(@comment.post) }
        format.xml  { head :ok }
      end
    end
  
  
end

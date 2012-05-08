class CommentsController < ApplicationController
  respond_to :json

  def index
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments)
  end

  # for validation, can't use responders (batman expects errors to not have a root)
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    respond_to do |format|
      if @comment.save
        format.json { render :json => @comment }
      else
        format.json { render :json => @comment.errors, :status => :unprocessable_entity}
      end
    end
    #respond_with(@post,@post.comments.create(params[:comment]))
  end

  # for validation, can't use responders (batman expects errors to not have a root)
  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.update_attributes(params[:comment])
    respond_to do |format|
      if @comment.save
        format.json { render :json => @comment }
      else
        format.json { render :json => @comment.errors, :status => :unprocessable_entity}
      end
    end
    #respond_with(@post,@post.comments.update(params[:id],params[:comment]))
  end

  # responder ok here
  def destroy
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments.destroy(params[:id]))
  end
end

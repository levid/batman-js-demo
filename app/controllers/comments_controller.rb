class CommentsController < ApplicationController
  respond_to :json

  def index
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments)
  end

  def create
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments.create(params[:comment]))
  end

  def update
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments.update(params[:id],params[:comment]))
  end

  def destroy
    @post = Post.find(params[:post_id])
    respond_with(@post,@post.comments.destroy(params[:id]))
  end
end

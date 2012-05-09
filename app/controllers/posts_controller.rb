class PostsController < ApplicationController
  respond_to :json

  def index
    #respond_with Post.includes(:comments).page(params[:page]).per(params[:limit])
    respond_to do |format|
      format.json { render :json => }
    end
  end

  def show
    respond_with Post.find(params[:id], :include => :comments)
  end

  # for validation, can't use responders (batman expects errors to not have a root)
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.json { render :json => @post }
      else
        format.json { render :json => @post.errors, :status => :unprocessable_entity}
      end
    end
    #respond_with Post.create(params[:post])
  end

  # for validation, can't use responders (batman expects errors to not have a root)
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.json { render :json => @post }
      else
        format.json { render :json => @post.errors, :status => :unprocessable_entity}
      end
    end
    #respond_with Post.update(params[:id], params[:post])
  end

  # batman can handle Rails 3 respond for this action
  def destroy
    respond_with Post.destroy(params[:id])
  end
end
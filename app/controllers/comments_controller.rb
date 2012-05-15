class CommentsController < ApplicationController
  respond_to :json

  def index
    @post = Post.find(params[:post_id])
    #respond_with(@post,@post.comments)
    page = params[:offset].to_i / 10
    respond_to do |format|
      format.json { render :json => {:comments => @post.comments.order("updated_at desc").page(page+1).per(params[:limit]), :total_count => @post.comments.count }}
    end

  end

  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
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
    @comment = Comment.find(params[:id])
    @comment = @comment.update_attributes(params[:comment])
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
    @comment = Comment.find(params[:id])
    respond_with(@comment.post,@comment.destroy)
  end
end

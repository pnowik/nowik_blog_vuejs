class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if current_user.try(:admin?) || current_user.try(:mod?)
      @comment.published = true
    end
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
    end
  end

  def publish
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.published = true
    @comment.save
    redirect_to @post
  end

  def unpublish
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.published = false
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = "Updated post"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
    flash[:success] = "deleted post"
  end

  def comment_params
    params.require(:comment).permit(:body, :id)
  end
end
class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if current_user.admin?
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

  def comment_params
    params.require(:comment).permit(:body, :id)
  end
end
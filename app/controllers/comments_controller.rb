class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  before_action :fin_post
  before_action :authenticate_user!

  def create
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
    @comment.published = true
    @comment.save
    redirect_to @post
  end

  def unpublish
    @comment.published = false
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    if @comment.user_id != current_user.id && current_user.try(:standard?)
      redirect_to post_path(@post.id)
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @post
      flash[:success] = "Updated comment"
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:success] = "deleted comment"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def fin_post
    @post = Post.find(params[:post_id])
  end
end
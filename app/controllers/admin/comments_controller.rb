class Admin::CommentsController < Admin::BaseController
  before_action :find_comment, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  before_action :find_post
  before_action :authenticate_user!
  before_action :user_admin


  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if current_user.try(:admin?) || current_user.try(:mod?)
      @comment.published = true
    end
    if @comment.save
      redirect_to(admin_post_comments_path)
    else
      flash.now[:danger] = "error"
    end
  end

  def index
    @comments = Comment.where(post_id: @post.id).paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:success] = "deleted comment"
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @post
      flash[:success] = "Updated comment"
    else
      render 'edit'
    end
  end

  def publish
    @comment.published = true
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def unpublish
    @comment.published = false
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def user_admin
    redirect_to posts_path unless current_user.try(:admin?) || current_user.try(:mod?)
  end

end

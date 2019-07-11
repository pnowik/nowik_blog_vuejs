class Admin::CommentsController < Admin::BaseController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if current_user.admin?
      @comment.published = true
    end
    if @comment.save
      redirect_to(admin_post_comments_path)
    else
      flash.now[:danger] = "error"
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(["post_id = ?", "#{@post.id}"]).paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:success] = "deleted post"
  end

  def update
  end

  def edit
  end

  def publish
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.published = true
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def unpublish
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
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

end

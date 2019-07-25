class Admin::PostsController < Admin::BaseController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_admin

  def index
    @posts = Post.search(params[:term]).paginate(page: params[:page], per_page: 20)
  end

  def show
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
    authorize [:admin, @post]
  end

  def create
    @user = current_user
    @post = @user.posts.build(allowed_params)

    if @post.save
      flash[:success] = "Created new post"
      redirect_to admin_post_path(@post.id)
    else
      render 'new'
    end
  end

  def edit
    authorize [:admin, @post]
  end

  def update
    authorize [:admin, @post]
    if @post.update_attributes(allowed_params)
      flash[:success] = "Updated post"
      redirect_to admin_post_path(@post.id)
    else
      render 'edit'
    end
  end

  def destroy
    authorize [:admin, @post]
    @post.destroy
    redirect_to admin_posts_path
    flash[:success] = "deleted post"
  end

  private
  def allowed_params
    params.require(:post).permit(:title, :subtitle, :body, :term)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def user_admin
    redirect_to posts_path unless current_user.try(:admin?) || current_user.try(:mod?)
  end
end

class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :user_admin

  def index
    @users = User.search(params[:term]).paginate(page: params[:page], per_page: 20)
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(allowed_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
    flash[:success] = "deleted user"
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email, :avatar, :role, :term)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_admin
    redirect_to posts_path unless current_user.try(:admin?) || current_user.try(:mod?)
  end
end
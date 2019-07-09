class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
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
    params.require(:user).permit(:name, :email, :avatar, :admin)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

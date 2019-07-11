class Admin::BaseController < ActionController::Base
  include Pundit

  layout "admin"

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to root_path
    flash[:notice] = "You can't do this"
  end
end
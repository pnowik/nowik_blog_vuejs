class Admin::BaseController < ActionController::Base
  layout "admin"

  before_action :require_admin

  def require_admin
    # ...
  end
end
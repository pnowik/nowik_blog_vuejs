class Admin::CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def new?
    user.role == 'admin' || user.role == 'mod'
  end

  def edit?
    user.role == 'admin' || user.role == 'mod'
  end

  def update?
    user.role == 'admin' || user.role == 'mod'
  end

  def destroy?
    user.role == 'admin' || user.role == 'mod'
  end

  def publish?
    user.role == 'admin' || user.role == 'mod'
  end

  def unpublish?
    user.role == 'admin' || user.role == 'mod'
  end
end

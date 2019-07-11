class Admin::PostPolicy < ApplicationPolicy
  attr_reader :user, :post, :comment

  def initialize(user, post, comment)
    @user = user
    @post = post
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
end

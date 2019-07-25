class Admin::PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
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

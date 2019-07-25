class Admin::UserPolicy < ApplicationPolicy
  attr_reader :user, :other_user

  def initialize(user, other_user)
    @user = user
    @other_user = other_user
  end

  def edit?
    user.role == 'admin' || (user.role == 'mod' && other_user.role != 'admin')
  end

  def update?
    user.role == 'admin' || user.role == 'mod'
  end

  def destroy?
    user.role == 'admin' || user.role == 'mod'
  end
end

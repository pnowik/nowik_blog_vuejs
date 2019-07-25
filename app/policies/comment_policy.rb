class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    user.role == 'admin' || user.role == 'mod' || (comment.user_id == user.id && user.role == 'standard')
  end

  def publish?
    user.role == 'admin' || user.role == 'mod'
  end

  def unpublish?
    user.role == 'admin' || user.role == 'mod'
  end
end

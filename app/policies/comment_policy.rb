class CommentPolicy < ApplicationPolicy
  attr_reader :user, :post, :comment

  def initialize(user, post, comment)
    @user = user
    @post = post
    @comment = comment
  end
end

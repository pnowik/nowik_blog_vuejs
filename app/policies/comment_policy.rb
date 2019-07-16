class CommentPolicy
  attr_reader :user, :post, :comment

  def initialize(user, post, comment)
    @user = user
    @post = post
    @comment = comment
  end

  def edit?
    user.role == 'admin' || user.role == 'mod'
  end
end

class ApplicationPolicy
  attr_reader :user, :post, :comment

  def initialize(user, post, comment)
    @user = user
    @post = post
    @comment = comment
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope, :post, :comment

    def initialize(user, scope, post, comment)
      @user = user
      @scope = scope
      @post = post
      @comment = comment
    end

    def resolve
      if user.role == 'admin'
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end

class BookPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  def index?
    true
  end

  def show?
    scope.where(id: book.id).exists?
  end

  def create?
    !user.nil?
  end

  def new?
    create?
  end

  def update?
    user.id == book.user_id
  end

  def edit?
    update?
  end

  def destroy?
    user.id == book.user_id if !user.nil?
  end

  def wish?
    create?
  end

  def scope
    Pundit.policy_scope!(user, book.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

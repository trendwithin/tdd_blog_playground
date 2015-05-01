class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && (user.admin? || user.author?)
  end

  def update?
    user.present? && user == post.user # && (user.admin? || user.author?)
  end

  def destroy?
    user.present? && user.admin?
  end

  private
  def post
    record
  end
end

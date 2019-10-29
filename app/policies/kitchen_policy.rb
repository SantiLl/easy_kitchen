class KitchenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    allow_user?
  end

  def destroy?
    allow_user?
  end

  private

  def allow_user?
    record.user == user
  end
end

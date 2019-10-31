class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    allow_user?
  end

  private

  def allow_user?
    record == user
  end
end

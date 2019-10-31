class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    allow_user?
  end

  def allow_user?
    record.user == user
  end
end

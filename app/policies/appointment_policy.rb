class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
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

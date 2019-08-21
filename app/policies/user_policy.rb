class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    owner?
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  private

  def owner?
    record == user
  end
end

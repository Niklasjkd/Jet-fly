class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    owner?
  end

  def destroy?
    owner?
  end

  def save?
    true
  end

  def create?
    true
  end

  private

  def owner?
    record.user == user
  end
end

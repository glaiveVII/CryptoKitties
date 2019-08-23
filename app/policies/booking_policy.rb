class BookingPolicy < ApplicationPolicy
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
    # user.admin || record.owner == user
  end

  def destroy?
    user.admin || record.owner == user
    # admin user can delete any booking
    # or
    # user can delete his own booking
  end
end

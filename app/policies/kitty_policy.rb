class KittyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    # user.is_partner if user
  end

  def update?
    # record_owner?
  end

  private

  def record_owner?
    record.user == user
  end
end

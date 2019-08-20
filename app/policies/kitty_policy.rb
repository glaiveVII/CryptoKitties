class KittyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def update? # both edit and update
    # here is it user or owner???????????
    user.admin || kitty_owner?
    # record: instance given as argument to the method authorize
    # user: current_user
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    user.admin || kitty_owner?
  end

  private

  def kitty_owner?
    record.user == user
  end
end

class KittyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.admin
      #   scope.all
      # else
      #   scope.where(owner: user)
      # end
      scope.all
    end
  end

  def update? # both edit and update
    # here is it user or owner???????????
    user.admin || record.owner == user
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
    user.admin || record.owner == user
  end

end

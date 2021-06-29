class PropositionPolicy < ApplicationPolicy
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

  def destroy?
    return true
  end

  def validate?
    return true
  end
end

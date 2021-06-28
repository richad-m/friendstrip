class InvitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      true
    end

    def accept?
      true
    end
  end
end

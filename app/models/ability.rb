class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      end

      can :read, Delivery
      can :create, Delivery
      can :create, TaskSubscription
    end

    can :read, Task
  end
end

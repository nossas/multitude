class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :manage, :all
    end

    can :create, TaskSubscription
    can :create, Delivery
    can :deliver, Delivery
    can :read, :all
  end
end

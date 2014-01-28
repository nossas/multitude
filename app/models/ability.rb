class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :manage, :all
    end

    can :create, Delivery
    can :read, :all
  end
end

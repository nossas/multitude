class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      end

      can :create, Delivery
      can :create, TaskSubscription
      can :view_status, Delivery, user_id: user.id
    end

    can :read, Delivery
    can :read, Task
  end
end

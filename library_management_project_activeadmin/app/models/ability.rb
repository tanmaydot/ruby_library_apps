class Ability
  include CanCan::Ability

  def initialize(user)
    current_user ||= AdminUser.new
    if user.role == "admin"
      can :manage, AdminUser
      can :manage, MembershipPlan
      can :manage, Transaction
      can :manage, BookAllotment
      can :manage, Section
      can :manage, Shelf
      can :manage, Book
    elsif user.role == "user"
      can :read, Section
      can :read, Shelf
      can :read, Book
    end
    can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"
  end
end

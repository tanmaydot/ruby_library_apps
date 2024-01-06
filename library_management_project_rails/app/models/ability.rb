# frozen_string_literal: true
class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin?
      can :manage, Book
      can :manage, Section
      can :manage, Rak
      can :manage, User
      can :read, User
    elsif user.user?
      can :read, Book
      can :read, Section
      can :read, Rak
    end
  end
end

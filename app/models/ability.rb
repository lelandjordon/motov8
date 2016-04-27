class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user
      can :create, Post
      can :destroy, Post
    end

    can [:update, :destroy], Post, :user_id => user.id

    # if user.admin
    #   can :manage, Post
    # end

  end
end

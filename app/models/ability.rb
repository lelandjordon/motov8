class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment
    if user
      can :create, Post
      can [:update, :destroy], Post, :author_id => user.id
      can :create, Comment
      can [:update, :destroy], Comment, :author_id => user.id
    end


    # if user.admin
    #   can :manage, Post
    # end

  end
end

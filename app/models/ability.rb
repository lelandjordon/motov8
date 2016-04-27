class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    if user
      can :create, Post
      can [:update, :destroy], Post, :author_id => user.id
      can :create, Comment
    end


    # if user.admin
    #   can :manage, Post
    # end

  end
end

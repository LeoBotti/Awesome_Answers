class Ability
  include CanCan::Ability
  # Inside this file, the `current_user` is passed as the only
  # argument to initialize.
  #               ð âââÂ current_user 
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
      # When using :all instead of a class name, the rule
      # will apply to ALL classes in your program.

      # In the rule below, this means that the admin user
      # can manage EVERYTHING!
      can :manage, :all
    else
      can :read, :all
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # When defining a permission with cancancan, use the `can` in
    # the `initialize` method of this file. The method takes the
    # following arguments:

    # - A symbol that represents the action that we're writing a permission
    #   rule for.
    # - A class of the object being affected by this permission rule usually
    #   models. (e.g. Question, Answer, User, etc)
    # - A block that must return a boolean. If true, the user has
    #   permission to perform the action on that class. If false, the
    #   doesn't.
    can(:delete, Question) do |question|
      # |question| is the instance of the Question
      # that will be tested.
      question.user == user
    end

    # :manage is a special action that essentially allows
    # a user to perform any action on the class' instances
    # if the block returns true.
    can(:manage, Question) do |question|
      user == question.user
    end

    can(:manage, Answer) do |answer|
      user == answer.user
    end
  end
end
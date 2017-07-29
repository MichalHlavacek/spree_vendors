class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('manager')
      can [:admin, :index, :new, :create, :show, :edit, :update, :destroy], Spree::Product
      can [:admin, :manage], Spree::Order
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)
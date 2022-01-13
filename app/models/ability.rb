# frozen_string_literal: true

class Ability
  attr_reader :user

  include CanCan::Ability

  def initialize(user)
    @user = user

    case user&.role
    when nil
      public_ability
    when 'Продавец'
      seller_ability
    when 'Покупатель'
      buyer_ability
    end
    
  end

  def public_ability
    can :create, :sign_up
    can :create, :sign_in
    can :read, :store
    can :read, :order
  end

  def seller_ability
    can :destroy, :sign_in
    can %i[read create update destroy], :item
    can [:read, :create], :order
    can :read, :shopcart
  end

  def buyer_ability
    can :destroy, :sign_in
    can :read, :order
    can :read, :item
    can [:read, :create, :destroy], :order
    can :create, :item_rate
    can :read, :shopcart
  end

  private

  def whole_ability

  end

end

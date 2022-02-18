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
      customer_ability
    end
  end

  def public_ability
    can :create, :sign_up
    can :create, :sign_in
    can :read, :item
  end

  def seller_ability
    general_abilities
    can :destroy, :sign_in
    can %i[read create update destroy], :item
    can %i[create destroy], :order
  end

  def customer_ability
    general_abilities
    can :read, :item
    can :create, :item_rate
  end

  private

  def general_abilities
    can :destroy, :sign_in
    can %i[create destroy], :order
    can :create, :item_rate
    can %i[read destroy], :shopcart
  end

end

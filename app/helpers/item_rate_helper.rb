module ItemRateHelper
  def item_rates?
    user_rate_items.present?
  end

  def item_rates
    user_rate_items.item_rating
  end

  def votes_count
    @item.item_rates.size
  end

  def user_rate_items
    ItemRate.find_by(user_id: @user.id, item_id: @item.id)
  end

end
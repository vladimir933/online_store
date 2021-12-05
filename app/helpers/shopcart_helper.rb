module ShopcartHelper
  def total_item_rating(item)
    rates = item.item_rates
    
    total = rates.map(&:item_rating).sum.to_f / rates.size
    if total > 0
      total
    else
      0.0
    end
  end
end

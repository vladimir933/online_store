module ItemsHelper

  def show_item_rating(item = @item)
    if item.rating?
      '%.3f' % (item.rating / item.votes)
    else
      0.0
    end
  end

end

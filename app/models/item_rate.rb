class ItemRate < ApplicationRecord
  
  belongs_to :user
  belongs_to :item

  RATING = %i[1 2 3 4 5]

end

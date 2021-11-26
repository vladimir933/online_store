class Order < ApplicationRecord

    attr_accessor :item_id, :cart_id 

    belongs_to :item
    belongs_to :cart

end

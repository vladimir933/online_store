module SignUpHelper

    def create_cart(user)
      Cart.create(user_id: user.id)
    end
  
  end
  
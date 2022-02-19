# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_seller = User.create(name: 'SellerName', 
                          surname: 'SellerSurname', 
                          role: 'Продавец', 
                          birthday: '01.01.2000'.to_date, 
                          email: 'seller@test.com', 
                          password: '12345', 
                          password_confirmation: '12345'
                         )

user_buyer = User.create(name: 'BuyerName', 
                         surname: 'BuyerSurname', 
                         role: 'Покупатель', 
                         birthday: '01.01.2000'.to_date, 
                         email: 'buyer@test.com', 
                         password: '12345', 
                         password_confirmation: '12345'
                        )

Cart.create(user_id: 1)
Cart.create(user_id: 2)

50.times do
  item = {
    :name => (2..rand(50)).map { ('а'..'я').to_a[rand(26)] }.join,
    :user_id => 1,
    :kind => ['Для дома', 'Для сада', 'Для животных'][rand(0..2)],
    :description => (5..rand(200)).map { ('a'..'z').to_a[rand(26)] }.join,
    :price => rand(1.0..999_999_998.99),
    :delivery_time => rand(50)
  }
  
  img = ['diman.png', 'klushkich.jpg', 'kostyan.png', '123.png', 'maksech.png', 'vadya.png', 'vit\'ka.png'][rand(0..6)]
  
  items = Item.create(item)
  items.avatar.attach(io: File.open(Rails.root.join("/home/vladimir/Изображения/#{img}")), filename: img)
  10.times do |comment|
    comment = {
      :user_id => rand(1..2),
      :comment_time => Time.now.strftime('%d/%m/%Y %H:%M:%S'),
      :body => (1..rand(500)).map { ('a'..'z').to_a[rand(26)] }.join
    }
    items.comments.create(comment)
  end
end
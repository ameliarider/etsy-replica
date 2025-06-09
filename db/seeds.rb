user = User.create(name: "Test User 1", email: "first@test.com", role: "Seller")

product = Product.create(name: "Test product 1", user_id: 1, price: 50.0)

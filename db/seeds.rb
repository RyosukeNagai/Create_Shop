# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin',
    password: 'admin_pass'
  )
User.create!(
    email: 'a@a',
    password: 'aaaaaa',
  )
Category.create(category_id: 1, name: "靴", is_active: "販売中")
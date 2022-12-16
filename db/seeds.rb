# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create!(role_name: 'Admin', can_destroy: true)
Role.create!(role_name: 'Common', can_destroy: false)

User.create!(email: 'admin@mail.com', roles_id: Role.find_by(role_name: 'Admin').id, password: '123456')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "anyanwumiracle78@gmail.com",
             password: "m123456",
             admin: true,     
             created_at: Time.zone.now,    
             activated_at: Time.zone.now
             )

Admin.create!(email: "mailcoja@gmail.com",
             password: "m123456",
             admin: false,     
             created_at: Time.zone.now,    
             activated_at: Time.zone.now
             )
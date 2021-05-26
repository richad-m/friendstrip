# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


trip1 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:1, title:"best_in_spain")
trip2 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:2, title:"best_in_intaly")
trip3 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:3, title:"best_in_france")
trip4 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:4, title:"best_in_portugal")
trip5 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:5, title:"best_in_belgium")
trip6 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:6, title:"best_in_brazil")
trip7 = Trip.create(start_date:Date.new, end_date:Date.new, user_id:7, title:"best_in_usa")


proposition1 = Proposition.create(category:"food", start_date:Date.new, end_date:Date.new, due_date:Date.new, user_id:1, trip_id:1,  title:"Italian restaurant (dinner)", url:"urlitalianrestaurant", status:"validated")
proposition1 = Proposition.create(category:"activity", start_date:Date.new, end_date:Date.new, due_date:Date.new, user_id:1, trip_id:1,  title:"Beach", url:"www.bestbeach.com", status:"pending")
proposition1 = Proposition.create(category:"accomodation", start_date:Date.new, end_date:Date.new, due_date:Date.new, user_id:1, trip_id:1,  title:"Best hotel", url:"www.booking.com", status:"validated")
proposition1 = Proposition.create(category:"food", start_date:Date.new, end_date:Date.new, due_date:Date.new, user_id:1, trip_id:1,  title:"Burger for dinner", url:"burger.com", status:"pending")
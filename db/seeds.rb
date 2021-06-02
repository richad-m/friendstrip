puts "Cleaning database..."
puts "Cleaning votes..."
Vote.destroy_all
Proposition.destroy_all
puts "Cleaning invites..."
Invite.destroy_all
puts "Cleaning trips..."
Trip.destroy_all
puts "Cleaning users"
User.destroy_all

puts "Everything is cleaned. Time to create stuff"
file1 = URI.open("https://i.pravatar.cc/150?img=52")
file2 = URI.open("https://i.pravatar.cc/150?img=34")
file3 = URI.open("https://i.pravatar.cc/150?img=60")
file4 = URI.open("https://i.pravatar.cc/150?img=68")
file5 = URI.open("https://cdn.radiofrance.fr/s3/cruiser-production/2020/11/50a43a42-2380-4d5d-8e2c-e9b8f382d416/1200x680_booba_01072020_miami_gqfrance_paridukovic_0303.jpg")

user1 = User.create(email: "richad@friendstrip.com", password:"123456", first_name:"Richad")
User.last.avatar.attach(io: file1, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!
user2 = User.create(email: "clotilde@friendstrip.com", password:"123456", first_name:"Clotilde")
User.last.avatar.attach(io: file2, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!
user3 = User.create(email: "marc-antoine@friendstrip.com", password:"123456", first_name:"Marc-Antoine")
User.last.avatar.attach(io: file3, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!
user4 = User.create(email: "inaki@friendstrip.com", password:"123456", first_name:"Inaki")
User.last.avatar.attach(io: file4, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!
user5 = User.create(email: "booba@friendstrip.com", password:"123456", first_name:"Booba")
User.last.avatar.attach(io: file5, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!

#Setting up Trip1 to XXXX
trip1 = Trip.create(start_date: Date.new(2021,2,25), end_date: Date.new(2021,3,15), title: "Madrid 2021", user_id:user4.id, description:"Super voyage à Madrid prendre le sun", destination:"Madrid")
invite11 = Invite.create(trip_id:trip1.id, user_id: user1.id, accepted: true)
invite12 = Invite.create(trip_id:trip1.id, user_id: user2.id, accepted: true)
invite13 = Invite.create(trip_id:trip1.id, user_id: user3.id)

prop12 = Proposition.create(trip_id:trip1.id, user_id: user1.id, category: "activity", start_date: "2021-07-12", end_date: "2021-07-12", due_date: "2021-05-28", title: "Express City Tour by Electric Tuk-Tuk", description: "touktouk", url: "https://www.getyourguide.com/madrid-l46/welcome-to...", address: "Calle Ruiz de Alarcón 23, Madrid, Comunidad de Madrid, Spain")
prop13 = Proposition.create(trip_id:trip1.id, user_id: user2.id, category: "activity", start_date: "2021-07-12", end_date: "2021-07-12", due_date: "2021-05-28", title: "Football Game", description: "petit five trkl", url: "https://www.pistaenjuego.com/campos-madrid-rio-p45", address: "Avenida del Manzanares 15, Madrid, Comunidad de Madrid, Espagne", status: "validated")
prop14 = Proposition.create(trip_id:trip1.id, user_id: user2.id, category: "food", start_date: "2021-07-12", end_date: "2021-07-12", due_date: "2021-05-28", title: "The Westin Palace", description: "bel hotel", url: "https://www.larotondapalace.com/", address: "Plaza de las Cortes 7, Madrid, Comunidad de Madrid, Espagne")
prop15 = Proposition.create(trip_id:trip1.id, user_id: user4.id, category: "accomodation", start_date: "2021-07-12", end_date: "2021-07-12", due_date: "2021-05-28", title: "Entre Santos Restaurant", description: "miamiam", url: "https://www.tripadvisor.fr/Restaurant_Review-g187514-d14062978-Reviews-Entre_Santos_Madrid-Madrid.html", address: "Calle de San Bartolomé 4, Madrid, Comunidad de Madrid, Espagne")

vote11 = Vote.create(user_id: user1.id, proposition_id:prop12.id, comment:"Trop stylé le touktouk", status:"upvote")
vote12 = Vote.create(user_id: user2.id, proposition_id:prop13.id, comment:"Pas du foot svp", status:"downvote")
vote13 = Vote.create(user_id: user4.id, proposition_id:prop12.id, comment:"touk touk, c'est le son de la police", status:"upvote")

#Setting up Trip2 to XXXXX
trip2 = Trip.create(start_date: Date.new(2021,9,5), end_date: Date.new(2021,10,5), title: "Road trip USA", user_id:user1.id, description:"Gros road trip de tarba entre potos", destination:"USA")
invite21 = Invite.create(trip_id:trip2.id, user_id: user4.id, accepted: true)
invite22 = Invite.create(trip_id:trip2.id, user_id: user2.id, accepted: true)
invite23 = Invite.create(trip_id:trip2.id, user_id: user3.id, accepted: true)
invite24 = Invite.create(trip_id:trip2.id, user_id: user5.id)

prop21 = Proposition.create(trip_id:trip2.id, user_id: user1.id, category: "accomodation", start_date: Date.new(2021,9,5), end_date: Date.new(2021,9,13), due_date: "2021-06-15", title: "Hotel Newton", description: "hotel pas cher", url: "http://www.thehotelnewton.com/", address: "2528 East Broadway, Todt Hill, New York, United States of America", status: "validated")
prop22 = Proposition.create(trip_id:trip2.id, user_id: user2.id, category: "accomodation", start_date: Date.new(2021,9,15), end_date: Date.new(2021,9,17), due_date: "2021-06-15", title: "Homewood Suites", description: "hotel plutot classe", url: "https://www.hilton.com/en/hotels/washwhw-homewood-suites-washington-dc-downtown/?SEO_id=GMB-HW-WASHWHW&y_source=1_MjA4MjQwNy03MTUtbG9jYXRpb24uZ29vZ2xlX3dlYnNpdGVfb3ZlcnJpZGU%3D", address: "1475 Massachusetts Ave SE, Washington, District of Columbia, United States of America")
prop23 = Proposition.create(trip_id:trip2.id, user_id: user3.id, category: "accomodation", start_date: Date.new(2021,9,17), end_date: Date.new(2021,9,20), due_date: "2021-06-15", title: "Airbnb River villas", description: "2 chambres 2 lits", url: "https://www.airbnb.fr/rooms/43569047?adults=4&translate_ugc=false&federated_search_id=438bb123-fc92-4a22-b9e0-d6496f6a3cb8&source_impression_id=p3_1622624406_PL7ZTnSyuFqbU7oI&guests=1", address: "101 Northwest 6th Avenue, Miami, Florida, United States of America")
prop24 = Proposition.create(trip_id:trip2.id, user_id: user3.id, category: "accomodation", start_date: Date.new(2021,9,23), end_date: Date.new(2021,9,27), due_date: "2021-06-15", title: "Airbnb Cozy appt", description: "2 chambres 2 lits", url: "https://www.airbnb.fr/rooms/49587164?adults=4&previous_page_section_name=1000&translate_ugc=false&federated_search_id=69fddcb0-e6a1-4778-a14b-804e54475ecf", address: "101 Northwest 6th Avenue, Miami, Florida, United States of America", status: "validated")
prop25 = Proposition.create(trip_id:trip2.id, user_id: user3.id, category: "activity", start_date: Date.new(2021,9,5), end_date: Date.new(2021,9,5), due_date: "2021-06-15", title: "Beach Jersey Shore", description: "All day trip, everything included!", url: "https://www.getyourguide.com/new-york-city-l59/new-york-city-beach-day-at-the-jersey-shore-t391441/", address: "790 7th Avenue, New York, New York, United States of America")
prop26 = Proposition.create(trip_id:trip2.id, user_id: user3.id, category: "food", start_date: Date.new(2021,9,16), end_date: Date.new(2021,9,16), due_date: "2021-06-15", title: "Brunch Cruise on the Odyssey", description: "brunch sur un boat oklm", url: "https://www.getyourguide.com/washington-dc-l62/washington-dcgourmet-brunch-or-dinner-cruise-on-the-odyssey-t279712/", address: "Washington Avenue Southwest, Washington, District of Columbia, United States of America", status: "validated")
prop26 = Proposition.create(trip_id:trip2.id, user_id: user3.id, category: "activity", start_date: Date.new(2021,9,16), end_date: Date.new(2021,9,16), due_date: "2021-06-15", title: "Everglades", description: "Qui veut voir des crocos ??", url: "https://www.getyourguide.com/everglades-national-park-l1867/everglades-national-park-airboat-tour-and-wildlife-show-t172401/", address: "Southwest 8th Street, Miami, Florida, United States of America")
prop26 = Proposition.create(trip_id:trip2.id, user_id: user1.id, category: "food", start_date: Date.new(2021,9,30), end_date: Date.new(2021,9,30), due_date: "2021-06-15", title: "Makan Restaurant", description: "Trop bien noté sur tripadvisor", url: "https://www.tripadvisor.fr/Restaurant_Review-g34438-d21106364-Reviews-Makan_Miami-Miami_Florida.html", address: "North Kendall Drive, Coral Gables, Florida, United States of America")

vote21 = Vote.create(user_id: user4.id, proposition_id:prop21.id, comment:"", status:"upvote")
vote22 = Vote.create(user_id: user2.id, proposition_id:prop21.id, comment:"les lits ont l'air dar", status:"upvote")
vote23 = Vote.create(user_id: user3.id, proposition_id:prop21.id, comment:"solide", status:"upvote")
vote24 = Vote.create(user_id: user2.id, proposition_id:prop23.id, comment:"trop cher en vrai, j'ai pas votre salaire moi", status:"downvote")
vote25 = Vote.create(user_id: user2.id, proposition_id:prop23.id, comment:"trop cher en vrai, j'ai pas votre salaire moi", status:"downvote")
vote26 = Vote.create(user_id: user3.id, proposition_id:prop23.id, comment:"trop cher en vrai, j'ai pas votre salaire moi", status:"downvote")


#Setting up a few other trips
trip3 = Trip.create(start_date: Date.new(2022,8,5), end_date: Date.new(2022,9,5), title: "Bali 2022", user_id:user5.id, description:"Bali mon gaaaars", destination:"Bali")
invite31 = Invite.create(trip_id:trip3.id, user_id: user2.id)
invite32 = Invite.create(trip_id:trip3.id, user_id: user1.id, accepted: true)


puts "All good, seed is ready"
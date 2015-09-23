# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create( name: "Olatoyosi", 
                  email: 'user@example.com', 
                  password: 'password', 
                  password_confirmation: 'password')

u2 = User.create( name: "Olalekan", 
                  email: 'user2@example.com',
                  password: 'password', 
                  password_confirmation: 'password')
 
b1 = Bucketlist.create(name: "Things to do before 50", user_id: u1.id)
b2 = Bucketlist.create(name: "Leave plan", user_id: u1.id)
 
b3 = Bucketlist.create(name: "Things to do before marriage", user_id: u2.id)
b4 = Bucketlist.create(name: "Christmas list", user_id: u2.id)
 
i1 = BucketlistItem.create(name: "visit all the continents", done: false, bucketlist_id: b1.id)

i2 = BucketlistItem.create(name: "go to canada", done: false, bucketlist_id: b2.id)

i3 = BucketlistItem.create(name: "have 4 beauty shops", done: false, bucketlist_id: b3.id)

i4 = BucketlistItem.create(name: "fall in love", done: false, bucketlist_id: b4.id)

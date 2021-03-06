# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner' #permet de réinitialiser la base à chaque relance du seed

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean


10.times do
	User.create(username:Faker::Name.first_name, email: Faker::Internet.email)
end

20.times do
	Gossip.create(title:Faker::Movies::StarWars.quote, content:Faker::Lorem.paragraph, user_id:User.all.sample.id)
end



# 10.times do
# 	Tag.create(title:Faker::Book.genre)
# end
# puts "Tags created"
#
#
# Gossip.all.each {|item| JoinGossipTag.create(gossip_id:item.id, tag_id:Tag.all.sample.id)}
#
# 20.times do
# 	PrivateMessage.create(content: Faker::Movies::StarWars.quote, user_id: User.all.sample.id)
# end
# puts "Private Messages created"
# 25.times do
# 	JoinPmRecipient.create(private_message_id: PrivateMessage.all.sample.id, user_id: User.all.sample.id)
# end
#
#
# 20.times do
# 	Comment.create(content: Faker::Movies::Lebowski.quote, gossip_id:Gossip.all.sample.id, user_id: User.all.sample.id)
# end
# puts "Comments created"
# #JoinPmRecipient.where(user_id: User.find_by(first_name: "Juanita").id).map{|item| PrivateMessage.find(item.private_message_id)} -> si tu veux connaitre les privates_messages reçus par Juanita...

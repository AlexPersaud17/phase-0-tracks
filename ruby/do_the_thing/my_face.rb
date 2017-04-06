require 'sqlite3'
require 'faker'

# Create tables to store friends and fan pages
db = SQLite3::Database.new('news_feed.db')
create_friends_table = <<-SQL
	CREATE TABLE IF NOT EXISTS friends(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		status VARCHAR(255),
		check_in VARCHAR(255)
		)
SQL
create_fan_pages_table = <<-SQL
	CREATE TABLE IF NOT EXISTS fan_pages(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
		)
SQL
create_pages_liked_table = <<-SQL
	CREATE TABLE IF NOT EXISTS pages_liked(
		id INTEGER PRIMARY KEY,
		friend_id INTEGER,
		fan_id INTEGER,
		FOREIGN KEY (friend_id) REFERENCES friends(id),
		FOREIGN KEY (fan_id) REFERENCES fan_pages(id)
		)
SQL
db.execute(create_friends_table)
db.execute(create_fan_pages_table)
db.execute(create_pages_liked_table)

# Populate tables with MyFace users and related information
def create_friends(db, name, status, check_in)
	db.execute('INSERT INTO friends (name, status, check_in) VALUES	(?, ?, ?)', [name, status, check_in])
end

how_many_friends = rand(10) + 10
how_many_friends.times do
	create_friends(db, Faker::HarryPotter.character, Faker::HarryPotter.quote, Faker::HarryPotter.location)
end

# Populate tables with MyFace fan page names
def create_fan_pages(db, name)
	db.execute('INSERT INTO fan_pages (name) VALUES	(?)', [name])
end

how_many_fan_pages = rand(10) + 5
how_many_fan_pages.times do
	random_pages = [Faker::Vehicle.unique.manufacture, Faker::University.unique.name, Faker::Superhero.unique.name, Faker::Pokemon.unique.name, Faker::Company.unique.name, Faker::Address.unique.country, Faker::App.unique.name]
	create_fan_pages(db, random_pages.sample)
end

# Create many-to-many relationships between MyFace users and fan pages
def pages_liked(db, friend_id, fan_id)
	db.execute('INSERT INTO pages_liked (friend_id, fan_id) VALUES	(?, ?)', [friend_id, fan_id])
end

how_many_friends.times do |friend| # zero indexed; x+1
	total_likes = rand(5)+1
	total_likes.times do
		pages_liked(db, friend+1, rand(how_many_fan_pages)+1)
	end
	
end

# USER INTERFACE (?)
puts "Welcome to MyFace!"
puts "Please enter your username to log in."
username = gets.chomp.capitalize
puts "Welcome back #{username}!"
puts "What would you like to do?"
puts "You can enter 'My Profile', 'Status Update', 'Check In', 'News Feed', 'View Friends', or 'Logout' when you're done!"

choice = gets.chomp.downcase
case choice
when "my profile"
	puts "\n\n"
	puts "Name: #{username}"
	puts "Last Status Update: '#{Faker::Friends.quote}'"
	puts "Last Check In: #{Faker::Friends.location}"
	puts "You have #{how_many_friends} friends!"
# when "status update"

# when "check in"

# when "news feed"

# when "view friends"

# when "logout"
else
	puts "Sorry, that is not a valid entry."
end


# who_likes_what = db.execute('select distinct friends.name, fan_pages.name from friends join pages_liked on pages_liked.friend_id = friends.id join fan_pages on pages_liked.fan_id = fan_pages.id')
# who_likes_what.each do |who, what|
# 	puts "#{who} likes #{what}."
# end
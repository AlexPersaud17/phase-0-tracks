# WELCOME TO MYFACE! (Get it? MySpace + Facebook???)
# Created by Alex Persaud

require 'sqlite3'
require 'faker'

# Create tables to store friends and fan pages
db = SQLite3::Database.new('my_face_database.db')
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

# Populate table with MyFace users and related information
def create_friends(db, name, status, check_in)
	db.execute('INSERT INTO friends (name, status, check_in) VALUES	(?, ?, ?)', [name, status, check_in])
end

# Create MyFace users of many different backgrounds
how_many_friends = rand(10) + 10
how_many_friends.times do
	type_of_friend = rand(5) + 1
	case type_of_friend
	when 1
		create_friends(db, Faker::HarryPotter.character, Faker::HarryPotter.quote, Faker::HarryPotter.location)
	when 2
		create_friends(db, Faker::Friends.character, Faker::Friends.quote, Faker::Friends.location)
	when 3
		create_friends(db, Faker::LordOfTheRings.character, Faker::ChuckNorris.fact, Faker::LordOfTheRings.location)
	when 4
		create_friends(db, Faker::StarWars.character, Faker::StarWars.quote, Faker::StarWars.planet)
	when 5
		create_friends(db, Faker::GameOfThrones.character, Faker::ChuckNorris.fact, Faker::GameOfThrones.city)
	end
end

# Populate table with MyFace fan page names
def create_fan_pages(db, name)
	db.execute('INSERT INTO fan_pages (name) VALUES	(?)', [name])
end

# Create various MyFace fan pages
how_many_fan_pages = rand(15) + 15
how_many_fan_pages.times do
	random_pages = [
		Faker::Vehicle.unique.manufacture, 
		Faker::University.unique.name, 
		Faker::Superhero.unique.name, 
		Faker::Pokemon.unique.name, 
		Faker::Company.unique.name, 
		Faker::Address.unique.country, 
		Faker::App.unique.name, 
		Faker::Book.unique.title, 
		Faker::Beer.unique.name, 
		Faker::Team.unique.name
	]
	create_fan_pages(db, random_pages.sample)
end

# Populate table with relationships between MyFace users and fan pages
def pages_liked(db, friend_id, fan_id)
	db.execute('INSERT INTO pages_liked (friend_id, fan_id) VALUES	(?, ?)', [friend_id, fan_id])
end

# Randomizes how many pages each MyFace user likes and what they are
how_many_friends.times do |friend|
	total_likes = rand(4)+1
	total_likes.times do
		pages_liked(db, friend+1, rand(how_many_fan_pages)+1)
	end
	
end

# SQL Commands
who_likes_what_sql = <<-SQL
	SELECT DISTINCT friends.name, fan_pages.name FROM friends 
	JOIN pages_liked ON pages_liked.friend_id = friends.id 
	JOIN fan_pages ON pages_liked.fan_id = fan_pages.id
SQL

news_feed_sql = <<-SQL
	SELECT name, status, check_in FROM friends
SQL

list_friends_sql = <<-SQL
	SELECT name FROM friends
SQL

# Executing SQL Commands
who_likes_what = db.execute(who_likes_what_sql)
list_friends = db.execute(list_friends_sql)
news_feed = db.execute(news_feed_sql)

my_status = Faker::Friends.quote
my_check_in = Faker::Friends.location

# USER INTERFACE
puts "Welcome to MyFace!"
puts "Please enter your username to log in."
username = gets.chomp.capitalize
puts "\n"
puts "Welcome back #{username}!"
puts "\n"
puts "What would you like to do?"


# Loops until MyFace user 'logs out'
loop do
	puts "\n"
	puts "You can enter 'My Profile', 'Status Update', 'Check In', 'News Feed', 'My Friends', or 'Logout' when you're done!"
	choice = gets.chomp.downcase
	case choice
	when "my profile"
		puts "\n"
		puts "Name: #{username}"
		puts "Last Status Update: '#{my_status}'"
		puts "Last Check In: #{my_check_in}"
		puts "You have #{how_many_friends} friends!"
	when "status update"
		puts "\n"
		puts "Press 'enter' to update!"
		my_status = gets.chomp
	when "check in"
		puts "\n"
		puts "Press 'enter' to update!"
		my_check_in = gets.chomp
	when "news feed"
		puts "\n"
		puts "Popular pages!"
		who_likes_what.each do |who, what|
			puts "--#{who} likes #{what}."
		end
		puts "\n"
		puts "What your friends are up to!"
		news_feed.each do |name, status, place|
			puts "--#{name} is at #{place} and says '#{status}'"
		end
	when "my friends"
		puts "\n"
		list_friends.each do |friend|
			puts "--#{friend[0]}"
		end
	when "logout"
		break
	else
		puts "\n"
		puts "Sorry, that is not a valid entry."
	end
end

puts "\n"
puts "Thank you for using MyFace!"
db.execute('drop table friends')
db.execute('drop table fan_pages')
db.execute('drop table pages_liked')
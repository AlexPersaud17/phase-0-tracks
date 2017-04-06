require 'sqlite3'
require 'faker'

db = SQLite3::Database.new('news_feed.db')
create_friends_table = <<-SQL
	CREATE TABLE IF NOT EXISTS friends(
		id INTEGER PRIMARY KEY,
		first_name VARCHAR(255),
		last_name VARCHAR(255),
		status VARCHAR(255)
		)
SQL
create_fan_pages_table = <<-SQL
	CREATE TABLE IF NOT EXISTS fan_pages(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
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
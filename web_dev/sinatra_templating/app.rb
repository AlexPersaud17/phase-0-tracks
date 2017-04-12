# require gems
require "sinatra"
require "sinatra/reloader" if development?
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/happy_birthday' do
	@students_new_age =  db.execute("SELECT * FROM students")
	age_incr=params[:incr].to_i
	student_id=1
	@students_new_age.each do |student|
		new_age = student['age']+=age_incr
		db.execute("UPDATE students SET age=? WHERE id=?", new_age, student_id)
		student_id+=1
	end
	redirect '/'
end

get '/new_list' do
	@students = db.execute("SELECT * FROM students")
	erb :index
end
# add static resources
class Santa

	attr_reader :reindeer_ranking, :age, :ethnicity
	attr_accessor :gender

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		#@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@gender = gender
		@ethnicity = ethnicity
		@age  = rand(140)
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays from the #{age} year old #{@gender} #{@ethnicity} Santa!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(bad_reindeer)
		@reindeer_ranking.each do |reindeer|

			if reindeer == bad_reindeer
				puts "#{bad_reindeer} was naughty."
				#puts "Index: " + @reindeer_ranking.index(reindeer).to_s

				@reindeer_ranking.insert(-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer)))

				break

			end
		end
	end


end

=begin
santas = []
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santas.each do |santa|
	santa.speak
	santa.eat_milk_and_cookies("Oreo")
end

nick = Santa.new("male", "Black")
p nick.reindeer_ranking
nick.speak
nick.gender = "female"
nick.speak
nick.get_mad_at("Rudolph")
p nick.reindeer_ranking
p nick.age
nick.celebrate_birthday
nick.celebrate_birthday
nick.celebrate_birthday
nick.celebrate_birthday
p nick.age
p nick.ethnicity
=end

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

santa_con = []
santa_count = 5
santa_count.times do
	santa_con << Santa.new(example_genders[rand(example_genders.length)], example_ethnicities[rand(example_ethnicities.length)])
end

santa_con.each do |santa|
	santa.speak
	
end
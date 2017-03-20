class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
  	num.times do
  		puts "Woof!"
  	end
  end

  def roll_over
  	puts "Roll over!"
  end

  def dog_years(human_years)
  	dog_years = human_years * 7
  	dog_years
  	p dog_years
  end

  def play_dead
  	puts "*dies*"
  end

  def initialize
  	puts "Initializing new puppy instance ..."
  end

end


rocky = Puppy.new
rocky.fetch("ball")
rocky.speak(5)
rocky.roll_over
rocky.dog_years(9)
rocky.play_dead

class B_Ball_Player

	def initialize
		puts "Another player joins your team!"
	end

	def dribble(num)
		num.times do
			puts "*dribbles the ball*"
		end
	end

	def shoots
		puts "For three!"
	end

end

players = []
counter = 0
while counter < 50
	players << B_Ball_Player.new
	counter += 1
end

players.each do |player|
	player.dribble(10)
	player.shoots
end
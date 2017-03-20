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
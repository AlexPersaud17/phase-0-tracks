puts "What is your hamster's name?"
name=gets.chomp.capitalize

puts "On a scale from 1 to 10, how loud is your hamster?"
volume=gets.chomp.to_i

puts "What is the color of the hamster?"
color=gets.chomp

puts "Is your hamster a good candidate for adoption? (y/n)"
adoption=gets.chomp
if adoption == "y"
	adoption="ready"
else adoption == "n"
	adoption ="not ready"
end
puts "What is the estimated age of your hamster?"
age=gets.chomp
if age == nil
	age="unknown"
end

puts "Your most recently registered hamster is a #{color} hamster named #{name}. #{name} is #{age} years old and has a noise rating of #{volume}. #{name} is #{adoption} to be adopted at this time."
# INTERIOR DESIGN PROJECT
# Client Name: __________
# Age: __________
# Number of Kids: __________
# Decor Theme: __________
# Budget? __________ (true/false)
# If there is a budget, how much? __________
# 

def b_amount(response)
	response == "yes" ? true : false
end

client_info ={}

puts "Client name?"
client_info[:name] = gets.chomp

puts "Client age?"
client_info[:age] = gets.chomp.to_i

puts "How many kids does the client have?"
client_info[:kids] = gets.chomp.to_i

puts "What theme does the client prefer?"
client_info[:decor_theme] = gets.chomp

puts "Is there a budget for this project?"
client_info[:budget] = false
client_info[:budget] = b_amount(gets.chomp.downcase)

if client_info[:budget]
	puts "How much? ($)"
	client_info[:b_amount] = gets.chomp.to_i
end


puts client_info
puts "If you would like to make a change, enter the variable name to edit! Otherwise, enter 'no'."

input=gets.chomp.downcase

if input != "no"
	input = input.to_sym
	puts "What is the new value of '#{input}'?"
	if input == :budget
		client_info[:budget] = b_amount(gets.chomp.downcase)
		if client_info[:budget]
			puts "How much? ($)"
			client_info[:b_amount] = gets.chomp.to_i
		else
			client_info.delete(:b_amount)
		end
	else
		client_info[input]=gets.chomp
	end
end

puts client_info
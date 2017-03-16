# SECRET NAME GENERATOr STEPS
# Split up first and last name
# Swap first name position with last name
# Run both names through methods that:
# 	Change vowels to following vowel
# 	Change consonants to following consonant
# Send both names back to a list
# Display name to user

def name_switch(first_name, last_name)
	first_name, last_name = last_name, first_name
end

def next_vowel(first_name, last_name)
	vowel_swapped = []
	vowel_replace = {'a' => 'e','e' => 'i', 'i' => 'o','o' => 'u', 'u' => 'a'}
	vowel_swapped << first_name.downcase.gsub(/[aeiou]/, vowel_replace)
	vowel_swapped << last_name.downcase.gsub(/[aeiou]/, vowel_replace)
	vowel_swapped
end

def next_consonant(first_name, last_name)
	consonant_swap = []
	consonant_replace = {'b' => 'c', 'c' => 'd', 'd' => 'f', 'f' => 'g', 'g' => 'h', 'h' => 'j', 'j' => 'k', 'k' => 'l', 'l' => 'm', 'm' => 'n', 'n' => 'p', 'p' => 'q', 'q' => 'r', 'r' => 's', 's' => 't', 't' => 'v', 'v' => 'w', 'w' => 'x', 'x' => 'y', 'y' => 'z', 'z' => 'b'}
	consonant_swap << first_name.downcase.gsub(/[bcdfghjklmnpqrstvwxyz]/, consonant_replace)
	consonant_swap << last_name.downcase.gsub(/[bcdfghjklmnpqrstvwxyz]/, consonant_replace)
	consonant_swap
end

agents_names = [['Alex', 'Persaud'], ['Felicia', 'Torres'], ['James', 'Bond']]

agents_names.each do |name|
	swapped = name_switch(name[0], name[1])
	vowel_replaced = next_vowel(swapped[0], swapped[1])
	consonant_replaced = next_consonant(vowel_replaced[0], vowel_replaced[1])
	puts "#{name[0]} #{name[1]} becomes #{consonant_replaced[0].capitalize} #{consonant_replaced[1].capitalize}"
end

# USER INTERFACE

secret_identities = []
all_codenames = []
loop do
	puts "What is your first and last name, agent?"
	input = gets.chomp
	real_name = []
	aliases = []
	break if input == "quit"
	first_last = input.split(' ')
	real_name << first_last[0].capitalize
	real_name << first_last[1].capitalize
	
	codename = next_consonant(
		(next_vowel(
			(name_switch(first_last[0], first_last[1])[0]), 
			(name_switch(first_last[0], first_last[1])[1])
		)[0]),

		(next_vowel(
			(name_switch(first_last[0], first_last[1])[0]), 
			(name_switch(first_last[0], first_last[1])[1])
		)[1])
	)
	aliases << codename[0].capitalize
	aliases << codename[1].capitalize
	puts "Your secret name is #{codename[0].capitalize} #{codename[1].capitalize}."
	secret_identities << real_name
	all_codenames << aliases
end

agent_num = 0
until count == secret_identities.length
	puts "#{secret_identities[agent_num][0]} #{secret_identities[agent_num][1]} is secretly #{all_codenames[agent_num][0]} #{all_codenames[agent_num][1]}."
	agent_num += 1
end
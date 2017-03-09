
def age_test(age, year)
	if Time.new.year - year == age || Time.new.year - (year + 1) == age
		return true
	elsif age > 100
		return false
	else
		return false
	end
end

def garlic_test(choice)
	if choice == "yes"
		return true
	elsif choice == "no"
		return false
	else
		return 0
	end
end

def health_test(choice)
	if choice == "yes"
		return true
	elsif choice == "no"
		return false
	else
		return 0
	end
end

def name_test(name)
	if name == "drake cula" || name == "tu fang" || name == "ivan tsukyablud" || name == "edward cullen"
		return false
	else
		return true
	end
end

vampire = false
while !vampire
	puts "What is your name?"
	ww_name=name_test(gets.chomp.downcase)
	
	if !ww_name
		vampire = true
		break
	end

	puts "How old are you? What year were you born?"
	ww_age=age_test(gets.chomp.to_i, gets.chomp.to_i)

	puts "Our cafeteria serves garlic bread. Should we order some for you? (yes/no)"
	ww_garlic=garlic_test(gets.chomp.downcase)

	puts "Would you like to enroll in the company's health insurance (yes/no)?"
	ww_health=health_test(gets.chomp.downcase)

	break 
end





case
when vampire
	puts "No further questions, you're definitely a vampire."
when !ww_age && !ww_garlic && !ww_health
	puts "Almost certainly a vampire."
when !ww_age && (!ww_garlic || !ww_health)
	puts "Probably a vampire."
when ww_age && (ww_garlic || ww_health)
	puts "Probably not a vampire."
else
	puts "Results inconclusive."
end



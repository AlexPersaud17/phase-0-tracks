int_array = [12, 4564, 78, 9, 0, 45]
def search(int_array, value)
	index=0
	exists=nil
	int_array.each do |number|
		if number == value
			puts "#{number} is at the index of #{index}"
			exists = true
			break
		else
			exists=nil
		end
		index+=1
	end
	if exists==nil
		p exists
	end
end



puts "Value?"
input = gets.chomp.to_i
search(int_array, input)




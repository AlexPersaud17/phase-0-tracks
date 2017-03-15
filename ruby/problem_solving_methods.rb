# Release 0

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



# Release 1

fib = [0, 1]
puts "How many values?"
limit = gets.chomp.to_i
i = 0
while i < limit - 2
	fib << fib[-1] + fib[-2]
	i+=1
end
p fib
# Testing given value with value of last index
test=218922995834555169026
p fib.fetch(-1)==test

# Release 2
=begin

Take's first value of array
Compare to following value of array
Sort to put larger number before
Repeat until all values of the array have been tested

=end

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] < array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

  break if not swapped
  end

  array
end

p bubble_sort(fib)
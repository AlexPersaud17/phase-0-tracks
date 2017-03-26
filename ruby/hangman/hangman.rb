class Hangman
	attr_reader :spaces, :winner
	def initialize(secret_word)
		@secret_word = secret_word
		@letters = secret_word.downcase.split('')
		@non_space_chars = 0
		@placeholder = "_ "
		@empty_space = "   "
		@spaces = []
		@winner = true
		@letters_chosen = []

		@letters.each do |letter|
			if letter != " "
				@spaces << @placeholder
			else
				@spaces << @empty_space
			end
		end

		#Spaces do not count as empty spaces
    	@spaces.each do |letter|
      		if letter != @empty_space
        	@non_space_chars += 1
      		end
    	end

    	#Number of guesses is related to how long the word is
    	@guess_count = @non_space_chars

		puts "You only have #{@non_space_chars} guesses, so choose wisely!"
		@spaces.each do |space|
			print space
		end
		puts ""
		guessing_loop
	end


	def guess(choice)
		#Stores letter that was chosen
	  	@letters_chosen << choice

	  	#Stores all instances of same letter
		@letter_location = @letters.each_index.select { |letter| @letters[letter] == choice }

		#Replaces empty space woth correct letter
		@letters.each do |letter|  
			if letter == choice
				@letter_location.each do |index|
					@spaces[index] = letter
				end
				@correct_guess = true
				break
			else
				@correct_guess = false
			end
		end
		@spaces.each do |letter|
			print letter
		end
		if !@correct_guess
				@guess_count -= 1
		end
		if @guess_count == 0
				@winner = false
		end
		@spaces
	end


	def check_win
	  puts ""

	  	#Checks for empty spaces
		if @spaces.include?(@placeholder) && @winner
		  guessing_loop
		elsif @winner
		  puts "You got the secret word '#{@secret_word}'! Well done! Do with it what you must."
		  @winner
		else
		  puts "Wow you had #{@secret_word.length} tries and you STILL didn't get it? The answer was '#{@secret_word}' by the way..."
		  @winner
		end

	end



	def guessing_loop
		puts ""
		if @guess_count != 1
			puts "#{@guess_count} guesses left!"
		else
			puts "#{@guess_count} guess left!"
		end

		puts "Guess please."
		@winner = true
		user_guess = gets.chomp

		#Letter that was already picked doesn't count towards @guess_count
		if @letters_chosen.include?(user_guess)
		  puts "You chose '#{user_guess}' already, go again."
		  @spaces.each do |letter|
			  print letter
		  end
		else
		  guess(user_guess)
		end
		check_win
	end

end




# COMMENTED OUT FOR TESTING
=begin

# PICK YOUR SUPER SECRET WORD OR PHRASE!
puts "Please enter your super secret word or phrase:"
secret_word = gets.chomp

# OR UNCOMMENT LINE BELOW TO HAVE A SECRET WORD CHOSEN FROM THE LIST !
random_words = ["centaur", "shocking", "power", "flirt", "falling", "facade", "clover", "pink", "warmth", "angriest", "weapon", "orphanage", "cruel", "careless", "event", "melody", "coincidence", "amplitude", "correlation", "application", "cuddle", "blasting", "subsonic"]
#secret_word = random_words.sample


new_game = Hangman.new(secret_word)
=end
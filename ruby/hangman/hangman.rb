class Hangman
	attr_reader :hidden_word, :winner
	attr_accessor :user_guess
	def initialize(secret_word)
		@secret_word = secret_word
		@secret_letters = secret_word.downcase.split('')
		@non_space_chars = 0
		@placeholder = "_ "
		@empty_space = "   "
		@hidden_word = []
		@winner = true
		@letters_chosen = []

		#Replaces letters of secret word with '_ '
		@secret_letters.each do |letter|
			if letter != " "
				@hidden_word << @placeholder
			else
				@hidden_word << @empty_space
			end
		end

		#Spaces in the secret phrase do not count towards hidden characters
    	@hidden_word.each do |letter|
      		if letter != @empty_space
        	@non_space_chars += 1
      		end
    	end

    	#Number of guesses is related to how long the word is
    	@guess_count = @non_space_chars

		puts "You only have #{@non_space_chars} guesses, so choose wisely!"
		@hidden_word.each do |space|
			print space
		end
		puts ""
	end


	def guess(choice)
		#Stores letter that was chosen
	  	@letters_chosen << choice

	  	#Stores all instances of same letter
		@letter_location = @secret_letters.each_index.select { |letter| @secret_letters[letter] == choice }

		#Replaces empty space woth correct letter
		@secret_letters.each do |letter|  
			if letter == choice
				@letter_location.each do |index|
					@hidden_word[index] = letter
				end
				@correct_guess = true
				break
			else
				@correct_guess = false
			end
		end

		@hidden_word.each do |letter|
			print letter
		end

		#Guess count goes down for the first time an incorrect letter is called
		if !@correct_guess
				@guess_count -= 1
		end

		if @guess_count == 0
				@winner = false
		end
		@hidden_word
	end


	def check_win
	  puts ""

	  	#Checks for empty spaces, runs guessing loop again, declares winner/loser
		if @hidden_word.include?(@placeholder) && @winner
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
		@user_guess = gets.chomp

		#Letter that was already picked doesn't count towards @guess_count
		if @letters_chosen.include?(@user_guess)
		  puts "You chose '#{@user_guess}' already, go again."
		  @hidden_word.each do |letter|
			  print letter
		  end
		else
		  guess(@user_guess)
		end
		check_win
	end

end


# PICK YOUR SUPER SECRET WORD OR PHRASE!
puts "Please enter your super secret word or phrase:"
secret_word = gets.chomp

# OR UNCOMMENT LINE BELOW TO HAVE A SECRET WORD CHOSEN FROM THE LIST !
random_words = ["centaur", "shocking", "power", "flirt", "falling", "facade", "clover", "pink", "warmth", "angriest", "weapon", "orphanage", "cruel", "careless", "event", "melody", "coincidence", "amplitude", "correlation", "application", "cuddle", "blasting", "subsonic"]
#secret_word = random_words.sample


new_game = Hangman.new(secret_word)
new_game.guessing_loop
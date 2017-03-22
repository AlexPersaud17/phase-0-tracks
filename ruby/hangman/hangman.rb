class Hangman
	attr_reader :letters, :correct_guess, :non_space_chars


	def initialize(secret_word)
		@letters = secret_word.downcase.split('')
		@non_space_chars = 0

		@placeholder = "_ "
		@spaces = []
		@letters.each do |letter|
			if letter != " "
				@spaces << @placeholder
			else
				@spaces << "   "
			end
		end

    @spaces.each do |letter|
      if letter != "   "
        @non_space_chars += 1
      end
    end
    
    
		puts "You only have #{@non_space_chars} guesses, so choose wisely!"

		@spaces.each do |space|
			print space
		end

		puts ""

	end


	def guess(choice)
		@letter_location = @letters.each_index.select { |letter| @letters[letter] == choice }

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
	end


	def check_win
		@spaces.include?(@placeholder)
	end
end



# PICK YOUR SUPER SECRET WORD OR PHRASE!
puts "Please enter your super secret word or phrase:"
secret_word = gets.chomp

# OR UNCOMMENT LINE BELOW TO HAVE A SECRET WORD CHOSEN FROM THE LIST !
random_words = ["centaur", "shocking", "power", "flirt", "falling", "facade", "clover", "pink", "warmth", "angriest", "weapon", "orphanage", "cruel", "careless", "event", "melody", "coincidence", "amplitude", "correlation", "application", "cuddle", "blasting", "subsonic"]

#secret_word = random_words[rand(random_words.length - 1)]



new_game = Hangman.new(secret_word)
puts ""
guess_count = new_game.non_space_chars
winner = true

loop do
	puts ""

	if guess_count != 1
		puts "#{guess_count} guesses left!"
	else
		puts "#{guess_count} guess left!"
	end

	puts "Guess please."
	winner = true
	new_game.guess(gets.chomp)
	new_game.check_win
	break if not new_game.check_win
	puts ""

	if !new_game.correct_guess
		guess_count -= 1
	end
	if guess_count == 0
		winner = false
		break
	end
end

puts ""
if winner
	puts "You got the secret word '#{secret_word}'! Well done! Do with it what you must."
else
	puts "Wow you had #{secret_word.length} tries and you STILL didn't get it? The answer was '#{secret_word}' by the way..."
end
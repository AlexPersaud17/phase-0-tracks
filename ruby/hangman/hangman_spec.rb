require_relative "hangman"

describe Hangman do
	let(:new_game) { Hangman.new("unicorns") }

	it "replaces underscore with correct letter if chosen" do
		new_game.guess("u")
		expect(new_game.spaces).to eq ["u", "_ ", "_ ", "_ ", "_ ", "_ ", "_ ", "_ ", ]
	end

	it "replaces underscore with correct letter if chosen" do
		new_game.guess("n")
		expect(new_game.spaces).to eq ["_ ", "n", "_ ", "_ ", "_ ", "_ ", "n", "_ ", ]
	end

	it "checks if there are any placeholders left to to declare win" do
		expect(new_game.check_win).to eq true
	end

end
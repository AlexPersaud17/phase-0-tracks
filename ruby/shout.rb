module Shout
	def self.yelling_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + "!!!" + " :)"
	end

end

puts Shout.yelling_happily("LOUD NOISES")
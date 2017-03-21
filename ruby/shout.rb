=begin
module Shout
	def self.yelling_angrily(words)
		words + "!!!" + " :("
	end

	def self.yelling_happily(words)
		words + "!!!" + " :)"
	end

end

puts Shout.yelling_happily("LOUD NOISES")
=end

module Shout
	def yelling_angrily(words)
		words + "!!!" + " :("
	end

	def yelling_happily(words)
		words + "!!!" + " :)"
	end

end

class Old_Man
	include Shout
end

class Me
	include Shout
end

old_man = Old_Man.new
me = Me.new

puts old_man.yelling_angrily("Get off my lawn")
puts me.yelling_happily("Coding is fun")

# classes
#
# Card
# Player
# Deck
# Dealer
# Hand

# methods
#
# deal
# hit
# stay
# win


class Card
	attr_accessor :suit, :value

	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def to_s
		"#{value} of #{suit}"
	end
end

class Deck
	attr_accessor :cards

	def initialize
	@cards = []
	["Hearts", "Diamonds", "Clubs", "Spades"].each do |suit|
		[2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].each do |num|
			@cards << Card.new(suit, num)
			end
		end
		scramble
	end

	def scramble
		cards.shuffle!
	end

	def deal_one
		cards.pop
	end

end

class Player
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

class Dealer
end

deck1 = Deck.new

puts deck1.cards


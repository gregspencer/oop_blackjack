
# classes
#
# Card
# Player
# Deck
# Dealer


class Card
end

class Player
end

class Deck
	attr_accessor :cards

	def initialize
	cards = []
	["Hearts", "Diamonds", "Clubs", "Spades"].each do |suit|
		[2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"].each do |num|
			cards << Card.new(suit, num)
			end
		end
		scramble
	end

	def scramble
		cards.shuffle
	end
	
end


class Dealer
end


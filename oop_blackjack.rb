
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

module Hand

	def show_hand
		
	end

	def calc_total
		
	end

	def stay

	end

	def hit(new_card)
		cards << new_card
  	puts "Dealing card #{new_card} to #{name}"
	end

end

class Player
	include Hand
	attr_accessor :name, :cards

	def initialize(name)
		@name = name
		@cards = []
	end

end

class Dealer
	include Hand
	attr_accessor :name, :cards

	def initialize
		@name = "Dealer"
		@cards = []
	end

end

deck1 = Deck.new
player1 = Player.new("Greg")
dealer = Dealer.new

player1.hit(deck1.deal_one)
player1.show_hand



dealer.hit(deck1.deal_one)
dealer.show_hand



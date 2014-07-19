
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
		puts cards
	end

	def stay

	end

	def hit(new_card)
		cards << new_card
  	puts "Dealing card #{new_card} to #{name}"
	end

	def calculate_total
  arr = cards.map{|card| card.value}
  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end
  arr.select{|n| n == "Ace"}.count.times do
    if total > 21
      total -= 10
    end
  end
  total
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

class BlackJackEngine
	attr_accessor :player, :dealer, :deck

	def initialize
		@player = Player.new("Player1")
		@dealer = Dealer.new
		@deck = Deck.new
	end

	def start
		player.hit(deck.deal_one)
		dealer.hit(deck.deal_one)
		player.hit(deck.deal_one)
		dealer.hit(deck.deal_one)
		player.show_hand
		puts player.calculate_total
		dealer.show_hand
		puts dealer.calculate_total
		player_turn
		dealer_turn
		show_winner

	end

	def blackjack_or_bust(player_or_dealer)
		if player_or_dealer.calculate_total == 21
			if player_or_dealer.is_a?(Player)
				puts "Congrats you hit blackjack!"
			elsif player_or_dealer.is_a?(Dealer)
				puts "Sorry, Dealer hit blackjack.  You lose."
			end
		elsif player_or_dealer.calculate_total > 21
			if player_or_dealer.is_a?(Player)
				puts "Sorry, you busted."
			elsif player_or_dealer.is_a?(Dealer)
				puts "Dealer busted.  You win!"
			end
		end
	end

	def player_turn
		blackjack_or_bust(player)
		while player.calculate_total < 21
			puts "(1) Hit? or (2) Stay?"
			hit_or_stay = gets.chomp
			if hit_or_stay == "2"
				puts "You chose to stay."
				puts "Your total is #{player.calculate_total}"
				break
			elsif hit_or_stay == "1"
				player.hit(deck.deal_one)
				blackjack_or_bust(player)
			end
		end
	end

	def dealer_turn
		blackjack_or_bust(dealer)
		while dealer.calculate_total < 17
			dealer.hit(deck.deal_one)
			blackjack_or_bust(dealer)
		end
	end

	def show_winner
		if player.calculate_total > dealer.calculate_total
			puts "You win!! You have #{player.calculate_total}"
			puts "Dealer has #{dealer.calculate_total}"
		else puts "You lose. You have #{player.calculate_total}"
			puts "Dealer has #{dealer.calculate_total}"
		end
	end

	#player_turn
	#dealer_turn
	#show_winner
end
game = BlackJackEngine.new
game.start



$: << File.expand_path(File.dirname(__FILE__))

#require 'playercontrol'
require 'card_deck'
require 'player_hand'
require 'dealer_ai'
require "player_chips"
require 'house'


def option(hand)
  command = ""
  while !(command == "H" or command == "S")
    puts "Hit or Stand on " + hand.name + " ?(H/S)"
    command = gets.chomp
  end
  return command
end


def prompt
  command = ""
  while !(command == "Y" or command == "N")
    puts "Would you like to play?(Y/N)"
    command = gets.chomp
  end
  return command
end

command = prompt
chips = PlayerChips.new
house = House.new

def play_hand(dealer, deck, player)
  command = option(player)
  until command == "S" or player.bust or player.blackjack
    if command == "H"
      player.hit(deck.deal)
      if !player.bust
        display_hand( "Your Main", player)
        display_hand( "Dealer", dealer)
        command = option(player)
      end
    end
  end
end

def display_hand(label, player1)
  puts label + " Hand: " + player1.cards.inspect + "(" + player1.value.to_s + ")"
end

while command != "N" #or house.endgame or blackjack?
  if command == "Y"

    #puts "Type \"help\" to list the commands."

    deck = CardDeck.new
    deck.reshuffle
    player1 = PlayerHand.new
    player1.name = "Main Hand"
    player1_split_hand = nil
    dealer = PlayerHand.new
    dealerai = DealerHand.new(dealer)




    puts "Dealing..."
    player1.hit(deck.deal)
    dealer.hit(deck.deal)
    player1.hit(deck.deal)
    dealer.hit(deck.deal)
    if chips.broke
      command == "N"
      puts "Go Home, You're Broke..."
      exit 0
    else
      chips.place_bet
      chips.show
      display_hand( player1.name, player1)
      display_hand( "Dealer", dealer)


      #chips.insurance(dealer)


      if !player1.blackjack or !dealer.blackjack
        if player1.can_split? == true
          command = ""
          while !(command == "Y" or command == "N")
            puts "Do you want to Split your hand?(Y/N)"
            command = gets.chomp
            if command == "Y"
            player1_split_hand = player1.split_pair
            player1_split_hand.name = "Split Hand"
            chips.double
            chips.show
               if player1.cards[0][1] == "A" and player1_split_hand.cards[0][1] == "A"
                player1.hit(deck.deal)
                player1_split_hand.hit(deck.deal)
              end
            puts player1_split_hand.cards.inspect
            elsif command == "N"
            end
          end
            display_hand( "Your Main", player1)
            display_hand( "Split", player1_split_hand) if player1_split_hand
            display_hand( "Dealer", dealer)
        end


        play_hand(dealer, deck, player1)

        if player1_split_hand !=nil
          play_hand(dealer, deck, player1_split_hand)
        end

        if !player1.bust
        dealer_command = dealerai.ai
          until dealer_command == "S" or dealer.bust
            if dealer_command == "H"
              dealer.hit(deck.deal)
              dealer_command = dealerai.ai
            end
          end
        else
        end
      end
      display_hand( "Your Main", player1)
      display_hand( "Split", player1_split_hand) if player1_split_hand
      display_hand( "Dealer", dealer)

      winner = house.endgame(player1, player1_split_hand, dealer)
      chips.chip_rules(winner, dealer, player1, player1_split_hand, chips)
    end
    elsif command == "N"
  end
  command = prompt 
end


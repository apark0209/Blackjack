#require 'player_chips'
class House

  def endgame(player1, player1_split_hand, dealer)

    if player1.blackjack and dealer.blackjack          
      puts "PUSH! Both Player and Dealer have BLACKJACK!"
    else
      if player1.blackjack and player1_split_hand == nil
        puts "BLACKJACK! You Win!"
        return player1
      elsif dealer.blackjack
        puts "Dealer BLACKJACK! Dealer Wins!"
        return dealer
      else
        if player1.bust
          puts "BUST! Dealer WINS!"
          return dealer
        elsif player1.value > dealer.value
          puts "You Win!"
          return player1
        elsif dealer.bust
          puts "DEALER BUST! You WIN!"
          return player1
        elsif dealer.value > player1.value
          puts "Dealer Wins!"
          return dealer
        else
          #if player1.has_insurance?
          #  puts "Push! No Gains, No Losses, AND you are insured."
          #else
          puts "PUSH! No Gains, No Losses"
        end
        if player1_split_hand != nil
          if player1_split_hand.value > dealer.value
            puts "Your Split Hand Wins!"
            return player1_split_hand
          elsif dealer.value > player1_split_hand.value
            puts "Split hand Lost. Dealer Won."
            return dealer
          elsif player1_split_hand.bust
            puts "Split Hand Busted!"
            return dealer
          else
            #if player1.has_insurance?
            #  puts "Push! No Gains, No Losses, AND you are insured."
            #else
            puts "PUSH! No Gains, No Losses on the Split Hand"      
          end
        end
      end
    end
  end
end


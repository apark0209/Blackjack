require 'card_deck'
require 'player_hand'

class DealerHand
  def initialize(hand)
    @hand = hand
  end
  def ai
    if @hand.value <= 16
    return "H"
    end
    if @hand.value > 21
    return "S"
    end
    if @hand.value > 16
    return "S"
    end
  end
end


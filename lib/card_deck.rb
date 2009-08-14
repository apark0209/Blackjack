class CardDeck
  def initialize
    @suits = ["spades", "hearts", "diamonds", "clubs"]
    @card_values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    @cards = []
    @card_values.each do |card_value|
        @suits.each do |suit|
            @cards << [suit, card_value]

        end
    end
  end

  def reshuffle
    @cards = @cards.sort_by {a = rand(52); a;}
  end
  
  def deal
    if @cards.length > 0
      hit = @cards.slice!(0)
    else
      puts "There aren't any cards left in the deck."
      return nil
    end
      return hit
  end

  def cut
    

  end
end


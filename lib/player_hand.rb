class PlayerHand

  def initialize
   @hand = []
   @name
  end

  def cards
    return @hand  
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
  end

  def value 
    hand_value = 0
    aces = 0
    @hand.each do |card|
      if %w{J Q K}.include? card[1]
        hand_value += 10
      elsif card[1] == "A"
        aces += 1
      else
        hand_value += card[1].to_i
      end
    end

    if aces >= 1
        if (hand_value+11+(aces-1)) > 21
          hand_value += 1*(aces)
        else
          hand_value += 1*(aces-1)
          hand_value += 11
        end
    end
    return hand_value
  end

  def hit(card)
    @hand << card
  end

  def bust
    if value > 21
      return true
    end
    return false
  end


  def stand
    
  end


  def ai
    if value < 16
      return "H"
    end
    if value > 21
      return "S"
    end
    if value > 16
      return "S"
     end
  end

  def can_split?
    if ["10", "J", "Q", "K"].include? @hand[0][1] and ["10", "J", "Q", "K"].include? @hand[1][1]
      return true
    elsif @hand[0][1] == @hand[1][1]
      return true
    elsif @hand[0][1] == "A" and @hand[1][1] == "A"
      return true
    else
      return false
    end
  end

  def split_pair  
    @split = PlayerHand.new
    @split.hit(@hand.pop)
    return @split
  end

  def has_ace
     @hand.each do |card|
       if card[1] == "A"
         return true
       end
     end
    return false
  end

  def blackjack
    return (value == 21 and @hand.size == 2)
  end

end









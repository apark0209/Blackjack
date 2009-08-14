class PlayerChips

  def initialize
    @bet = 0
    @player_value = 1500
    @house = 0
    @split = 0
  end

  def show
    puts "You Bet " + @bet.inspect
    puts "You have " + @player_value.inspect + " chips left."
  end

  def win
    @player_value += (2*@bet).to_i
    return @player_value
  end

  def place_bet
    bet = 0
    while !%w{1 5 10 25 100 500 all_in}.include?(bet)
      puts "Chip values are: 1, 5, 10, 25, 100, 500, or all_in. To add chips to bet, simply type the number of the chip you wish to bet."
      puts "How much will you bet?(type [chip value] to place bet.)"
      bet = gets.chomp
    end

    if bet == "all_in"
      go_all_in
    elsif !have_enough_to_bet?(bet.to_i)
      overbet
    elsif have_enough_to_bet?(bet.to_i)
      define_bet(bet.to_i)
    else
      puts "Go home, You're broke."
    end
    return @bet
  end

  def overbet
    if @bet > @player_value
      go_all_in
    end
  end

  def broke
    if @player_value == 0
      return true
    else
      return false
    end
  end


  def have_enough_to_bet?(bet)
    if (@player_value - bet) >= 0
      return true
    else
      return false
    end
  end

  def go_all_in
    @bet = @player_value
    @player_value = 0
  end

  def define_bet(bet)
    @player_value -= bet
    @bet = bet
  end

  def double  #add bet to @bet, subtract bet from player_value
    @player_value -= @bet
    @bet = @bet * 2   
    return @bet
  end

  def insurance(dealer)
    if %w{A}.include? dealer.cards
      command = gets.chomp
      while !(command == "Y" or command == "N")
        puts "Do you want INSURANCE?(Y/N)"
        command = gets.chomp
      end
      if command == "Y"
        @player_value -=(0.5*@bet).to_i
        @bet  += (0.5*@bet).to_i
        return true
      elsif command == "N"
      end
    else
      return false
    end
  end

  #def has_insurance(player1)
  #  if player1.insurance
  #    @player_value += @bet
  #    #return @bet
  #  end
  #end

  def chip_rules(winner, dealer, player1, player1_split_hand, player_bet) 
    if winner == player1_split_hand and player1_split_hand != nil
      win
      return @bet
    end
    if winner == player1
      if player1.blackjack
        @player_value += (@bet.to_f*1.5).to_i

        #elsif player1.insurance 
        #  @player_value += @bet  #take 1/2 bet from player_value
        #elsif player1.split_pair == true
        #???? @split
        # and @hand, bet x2
      else
        win
      end
    elsif winner == dealer
      @house += @bet.to_i
    elsif winner == nil
      @player_value += @bet
      return @player_value.to_s
    end
    show
    return @bet
    end

    def money_lost
      
    end
end

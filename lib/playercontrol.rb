#module Blackjack
#
#  class
#
#
#  class  PlayerControl
#    def initialize
#     @hand = []
#    end
#
#    def value
#
#
#    end
#
#    if aces >= 1
#        if (hand_value+11) > 21
#            hand_value += 1*(aces)
#        else
#          hand_value += 1*(aces-1)
#          hand_value += 11
#        end
#    end
#
#    return hand_value
#  end
#
#  def hit(card)
#    @hand << card
#  end
#
#  def bust
#    if value > 21
#      puts "BUST!"
#    end
#  end
#  end
#
#end
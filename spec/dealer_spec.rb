require File.join(File.dirname(__FILE__), "/spec_helper")
require 'dealer'

describe PlayerHand do

  before(:each) do
    @hand = DealerHand.new
  end

  it "should add up the cards but should not be zero" do
    @hand.value.should == 0
  end


  it "should add a card to the hand" do
    card = ["spades", "2"]
    @hand.hit(card)
    @hand.value.should == 2
  end

  it "should hit face card" do
    @hand.hit(["spades", "K"])
    @hand.value.should == 10
  end

  it "should make ace 1 if hand value is less than or equal to 20" do
    @hand.hit ["hearts", "10"]
    @hand.hit ["spades", "10"]
    @hand.hit ["spades", "A"]
    @hand.value.should == 21
  end

  it"should make ace 11 if hand value is less than or equal to 10" do
    @hand.hit ["hearts", "10"]
    @hand.hit ["spades", "A"]
    @hand.value.should == 21
  end

  it "should add up aces as 1 when hand_value is greater than 10" do
    @hand.hit ["spades", "3"]
    @hand.hit ["hearts", "A"]
    @hand.hit ["spades", "A"]
    @hand.hit ["clubs", "A"]
    @hand.hit ["diamonds", "A"]
    @hand.hit ["hearts", "10"]
    @hand.value.should == 17
  end

   it "should run BLACKJACK code when hand size is 2 and hand sum is 21" do
    @hand.hit ["clubs", "A"]
    @hand.hit ["clubs", "K"]
    @hand.value.should == 21
    @hand.blackjack.should == true
   end
  
end
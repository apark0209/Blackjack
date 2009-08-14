require File.join(File.dirname(__FILE__), "/spec_helper")
require 'player_hand'

describe PlayerHand do

  before(:each) do
    @hand = PlayerHand.new
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

  it "should add up aces as 1 when hand_value is greater than 10" do
    @hand.hit ["spades", "3"]
    @hand.hit ["hearts", "10"]
    @hand.hit ["hearts", "A"]
    @hand.hit ["spades", "A"]
    @hand.hit ["clubs", "A"]
    @hand.hit ["diamonds", "A"]

    @hand.value.should == 17
  end
  
  it "should add up aces as 1 when hand_value is greater than 10" do
    @hand.hit ["hearts", "9"]
    @hand.hit ["hearts", "A"]
    @hand.hit ["spades", "A"]

    @hand.value.should == 21
  end

  it "should add up aces as 1 when hand_value is greater than 10" do
    @hand.hit ["hearts", "9"]
    @hand.hit ["hearts", "A"]
    @hand.hit ["spades", "A"]
    @hand.hit ["clubs", "A"]
    @hand.value.should == 12
    @hand.bust.should == false
  end

  it "should run BLACKJACK code when hand size is 2 and hand sum is 21" do
    @hand.hit ["spades", "A"]
    @hand.hit ["clubs", "K"]
    @hand.value.should == 21
    @hand.blackjack.should == true
  end

  it "should deal 2 aces and 1 queen and not bust." do
    @hand.hit ["spades", "A"]
    @hand.hit ["clubs", "A"]
    @hand.hit ["hearts", "Q"]
    @hand.bust.should == false
    @hand.value
  end

  it "should split a hand into 2 and have equal values" do
    @hand.hit ["spades", "10"]
    @hand.hit ["hearts", "10"]
    @hand.value.should == 20
    @hand.can_split?.should == true
    split = @hand.split_pair
    @hand.value.should == split.value
    puts split
    puts @hand
  end

  it "should offer split when there are 2 aces in a hand" do 
    @hand.hit ["spades", "A"]
    @hand.hit ["hearts", "A"]
    @hand.can_split?.should == true
    split = @hand.split_pair
    @hand.value.should == split.value  
    puts split
    puts @hand
  end

end
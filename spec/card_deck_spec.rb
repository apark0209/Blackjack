require File.join(File.dirname(__FILE__), "/spec_helper")
require 'card_deck'

describe CardDeck do

  before(:each) do
    @deck = CardDeck.new
  end

  it "should Deal a Card" do
    @deck.deal.should_not be_nil
  end

  it "should deal 52 cards" do
    52.times {@deck.deal}
    @deck.deal.should be_nil
  end

  it "should not deal the same card twice" do
    cards = []
    52.times {cards << @deck.deal}
    (cards & cards).size.should == 52
  end

  it "should reshuffle" do
    first_card = @deck.deal
    @deck.reshuffle
    @deck.deal.should_not == first_card
  end

  it "should return a card" do
    card = @deck.deal
    card.size.should == 2
    puts card.inspect
  end

end
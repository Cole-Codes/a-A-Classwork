require 'rspec'
require 'Card'
require 'Deck'
require 'Game'
require 'Hand'
require 'Player'

describe Card do
  subject(:card) { Card.new('Spade','King') }

  describe '#initialize' do
    it 'accepts two arguments, suit and rank' do 
      card
    end

    it 'should set suit to equal passed in suit argument' do
      expect(card.suit).to eq('Spade')
    end

    it 'should set rank to equal passed in rank argument' do
      expect(card.rank).to eq('King')
    end

  end
end


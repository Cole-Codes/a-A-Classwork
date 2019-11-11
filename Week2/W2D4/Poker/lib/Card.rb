class Card
  SUITS = :Spade,:Clover,:Heart,:Diamond
  RANKS = :King,:Queen,:Jack,:Ace#,*(2..10).map(&:to_sym)

  attr_reader :suit, :rank

  def self.random
    rank = RANK.sample
    suit = SUITS.sample

    Card.new(suit,rank)
  end

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end


end
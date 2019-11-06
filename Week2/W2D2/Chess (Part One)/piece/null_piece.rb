require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize(symbol, board, pos)
    super
  end

  def move
  end

  def symbol
  end

end
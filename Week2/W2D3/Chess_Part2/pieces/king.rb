require_relative "./module/stepable"

class King < Piece

  include Stepable

  KING_MOVE = [ [1,0], [0,1], [-1,0], [0,-1], [-1,-1], [1,1] [-1,1], [1,-1] ]

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_diff
    KING_MOVE
  end

  def symbol
    :King
  end

end
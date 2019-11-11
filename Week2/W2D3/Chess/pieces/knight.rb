require_relative "./module/stepable"
# -*- coding: utf-8 -*-
# ruby
class Knight < Piece

  include Stepable

  KNIGHT_MOVE = [ [-2, -1], [-2, 1], [2, -1], [2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2] ]

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_diff
    KNIGHT_MOVE
  end

  def symbol
    :Knight
  end

end
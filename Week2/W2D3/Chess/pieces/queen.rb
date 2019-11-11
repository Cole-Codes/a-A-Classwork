require_relative "./module/slideable"

class Queen < Piece

  include Slideable

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    linear + diagonal
  end

  def symbol
    :Queen
  end

end
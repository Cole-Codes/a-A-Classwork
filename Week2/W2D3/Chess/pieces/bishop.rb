require_relative "./module/slideable"

class Bishop < Piece

  include Slideable

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    diagonal
  end

  def symbol
    :Bishop
  end

end
require_relative "./module/slideable"

class Rook < Piece

  include Slideable
  
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
    linear
  end

  def symbol
    :Rook
  end

end


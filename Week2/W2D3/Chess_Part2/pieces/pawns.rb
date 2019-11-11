class Pawns < Piece

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def move_dir
  end

  def symbol
    :Pawn
  end

end
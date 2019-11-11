

class Piece
  attr_reader :board, :color, :symbol
  attr_accessor :pos

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos

    board.add_piece(self, pos)
  end

  def to_s
    symbol
  end
  
  def valid_move?
    move.select do |pos|
      @board.in_board?(pos) && @board.is_null?(pos)
    end
  end

end


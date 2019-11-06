require_relative "./piece/null_piece.rb"
require_relative "./piece/pawns.rb"
require_relative "./piece/knight.rb"
require_relative "./piece/king.rb"
require_relative "./piece/queen.rb"
require_relative "./piece/rook.rb"
require_relative "./piece/bishop.rb"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    # place_piece
  end

  def place_piece
    # @grid[1].each.with_index do |tile , i| 
    #   @grid[1][i] = Pawns.new
    # end
    # @grid[6].each.with_index do |tile , i| 
    #   @grid[6][i] = Pawns.new
    # end
  end

  def move_piece(start_pos, end_pos)
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

end



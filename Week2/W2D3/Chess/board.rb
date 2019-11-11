require_relative "pieces"

class Board

  attr_reader :grid, :null

  def initialize
    @grid = grid
    populate
  end

  def populate
    @null = NullPiece.instance
    @grid = Array.new(8) {Array.new(8, null)}
    [:white, :black].each do |color|
      fill_pawn_row(color)
      fill_main_row(color)
    end
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def move_piece(start_pos, end_pos, color)
    piece = self[start_pos]
    raise 'It have to be your piece' if color != piece.color
    raise 'A piece have to be in start pos.' if piece == nil
    raise 'Piece can not move outside of board' if !piece.valid_move.include?(end_pos)
    self[end_pos], self[start_pos] = piece, null
    piece.pos = end_pos
  end

  def in_board?(pos)
    row, col = pos
    row.between?(0,7) && col.between?(0,7)
  end

  def fill_pawn_row(color)
    row = (color == :white) ? 1 : 6
    8.times { |col| Pawns.new(self, color, [row, col]) }
  end

  def fill_main_row(color)
    row = (color == :white) ? 0 : 7
    main_row = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    main_row.each_with_index do |rank, col|
      rank.new(self, color, [row, col])
    end
  end

  def is_null?(pos)
    self[pos] == null
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end

end

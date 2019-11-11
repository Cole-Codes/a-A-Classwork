require_relative "board"
# require_relative "piece"
require "colorize"
require_relative "cursor"

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def build_display_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      piece.to_s
    end
  end

  def render
    system("clear")
    build_display_grid.each { |rows| puts rows.join(' ')}
  end

end

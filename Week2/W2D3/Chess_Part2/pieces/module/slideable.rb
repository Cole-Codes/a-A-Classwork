module Slideable
  
  LINEAR = [ [0,1], [1,0], [0,-1],[-1,0] ]
  DIAGONAL = [ [1,1], [1,-1], [-1,-1], [-1,1] ]  

  def linear
    LINEAR
  end

  def diagonal
    DIAGONAL
  end

  def move
    possible_moves = []
    move_dir.each do |x, y|
      possible_moves.concat(make_moves(x, y))
    end
    possible_moves
  end

  def make_moves(dx, dy)
    cur_x, cur_y = pos
    possible_moves = []
    loop do
      cur_x += dx
      cur_y += dy
      pos = [cur_x, cur_y]
      break if !board.in_board?(pos)
      possible_moves << pos
    end
    possible_moves
  end

end
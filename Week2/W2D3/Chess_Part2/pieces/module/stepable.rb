module Stepable

  def move
    possible_moves = []
    move_diff.each do |x, y|
      possible_moves.concat(make_moves(x, y))
    end
    possible_moves
  end

  def make_moves(dx, dy)
    [ @pos[0] + dx , @pos[1] + dy ]
  end
  
end
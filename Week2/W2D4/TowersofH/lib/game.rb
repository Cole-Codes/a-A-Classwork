class Game
  attr_accessor :pile1, :pile2, :pile3, :game_over

  def initialize
    @pile1 = [8,7,6,5,4,3,2,1]
    @pile2 = []
    @pile3 = []
    @game_over = false
  end

  def move_disc
    puts 'Input two numbers betwen 1 and 3. Format: "1 and 2"'
    input = gets.chomp
    raise "Need to give proper input format" if !input[0].to_i.between?(0, 4) && !input[-1].to_i.between?(0, 4)
    case input
    when '1 and 2'
      @pile2.push(@pile1.pop) 
    when '1 and 3'
      @pile3.push(@pile1.pop)
    when '2 and 1'
      @pile1.push(@pile2.pop)
    when '2 and 3'
      @pile3.push(@pile2.pop)
    when '3 and 1'
      @pile1.push(@pile3.pop)
    when '3 and 2'
      @pile2.push(@pile3.pop)
    end
  end


  def won?
    if self.pile3 == self.pile3.sorted && self.pile3.length == 8
      puts "You won!"
      game_over = true
      return true
    end

    false
  end

end
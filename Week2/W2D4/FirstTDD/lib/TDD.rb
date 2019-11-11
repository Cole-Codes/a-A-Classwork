def my_uniq(arr)
  dups = Hash.new(0)
  arr.each { |el| dups[el] += 1}
  dups.keys
end

class Array
  def two_sum
    pairs = []
    self.each_with_index do |el1,i1| 
      self.each_with_index do |el2,i2|
        if i1 < i2 && el1 + el2 == 0
        pairs << [i1,i2]
        end
      end
    end

    return nil if pairs.empty?
    pairs
  end
end

def my_transpose(arr)
  width = arr.length
  height = arr.first.length

  grid = Array.new(width) { Array.new}

  width.times do |row|
    height.times do |col|
      grid[col][row] = arr[row][col]
    end
  end

  grid
end

def stock_picker(arr)
  return nil if arr.length < 2

  profits = Hash.new(0)
  
  arr.each_with_index do |el1,i1| 
    arr.each_with_index do |el2,i2|
      if i1 < i2 
        profits[el2-el1] = [i1,i2]
      end
    end
  end

  profit = profits.sort_by { |k,v| k } 
  profit[-1][-1]


end
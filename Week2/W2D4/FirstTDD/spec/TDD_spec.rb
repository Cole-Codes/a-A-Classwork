require 'rspec'
require 'TDD'

describe 'my_uniq' do
  it 'should return unique elements in the order they first appeared' do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1,2,3])
  end

  it 'returns original array if no duplicates' do
    expect(my_uniq([1,2,3,4,5])).to eq([1,2,3,4,5])
  end
end

describe Array do
  describe '#two_sum' do
    it 'should return an array of positions where the elements at those positions sum to zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'should return nil if no pairs sum to zero' do
      expect([1,2,3,4,5].two_sum).to eq(nil)
    end
  end
end

describe 'my_transpose' do
  it 'converts between the row-oriented and column-oriented representation of a 2D array' do
    expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end

  it 'should take in a 2D array of different lengths' do
    expect(my_transpose([[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]])).to eq([[1,1,1,1],[2,2,2,2],[3,3,3,3],[4,4,4,4]])
  end

end

describe 'stock_picker' do
    it 'should output the most profitable pair of days on which to first buy the stock and then sell the stock' do
      expect(stock_picker([25,40,50,30])).to eq([0,2])
    end

    it 'should return nil if array has less than two elements' do
      expect(stock_picker([100])).to eq(nil)
    end
end
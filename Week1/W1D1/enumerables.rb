class Array
  def my_each(&prc)
    self.length.times do |i|
        prc.call(self[i])
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each do |el|
        arr << el if prc.call(el)
    end
    return arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each do |el|
        arr << el if !prc.call(el)
    end
    return arr
  end

  def my_any?(&prc)
    self.my_each do |el|
        return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
        return false if !prc.call(el)
    end
    return true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
        if el.is_a(Array)
            flattened.concat(el.my_flatten)
        else
            flattened << el
        end
    end
    return flattened
  end

  def my_zip(*arrays)
    zip = []
    self.length.times do |i|
        zip2 = [self[i]]
        arrays.my_each do |arr|
            zip2 << arr[i]
        end
        zip << zip2
    end
    return zip
  end

  def my_rotate(val = 1)
    split = val % self.length
    self.drop(split) + self.take(split)
  end

  def my_join(seperator = "")
    str = ""
    self.my_each do |el|
        str << el + seperator
    end
    return str
  end

  def my_reverse
    reversed = []
    self.my_each do |el|
        reversed.unshift(el)
    end
    return reversed
  end
end
# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.


def factorials_rec(num)
  return [1,1].take(num) if num <= 2
  # return [] if num == 0
  # return [1] if num == 1

  fact = factorials_rec(num - 1)
  fact << (num - 1) * fact[-1]
end

# Using recursion and the `is_a?` method, write an `Array#deep_dup` method that 
# will perform a "deep" duplication of the interior arrays.

# def deep_dup(arr)
#   return arr if !arr.is_a?(Array)

#   duped = []

#   arr.each do |sub_array|
#     duped << deep_dup(sub_array)
#   end

#   duped
# end

def deep_dup(arr)
  arr.map{|el| !el.is_a?(Array) ? el : deep_dup(el)}
end
# iteration logic:

# def deep_dup(arr)
#   duped = []

#   arr.each do |sub_array|
#     new_sub = []
#     sub_array.each { |ele| new_sub << ele }
#     duped << new_sub
#   end
#   duped
# end

# Define a method `rec_sum(nums)` that returns the sum of all elements in an 
# array recursively

def rec_sum(nums)  #nums = [1,2,3,4]
  return 0 if nums.empty?

  first = nums.first
  rest = nums.drop(1)
  
  first + rec_sum(rest)
end

# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  return 1 if n == 0

  if n < 0
    1.0 / (b * exponent(b,  n.abs - 1))
  else
    b * exponent(b, (n - 1))
  end
end

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.

def first_even_numbers_sum(n)
  return 2 if n == 1

  (2 * n) + first_even_numbers_sum(n - 1) 

end

# It is sometimes necessary to be able to break down a number into its prime 
# factors.  The process is called prime factorization.  We can use a factor tree 
# to determine the prime factorization of a number:

#                12
#               /  \
#              /    \
#             4      3
#            / \
#           2   2

# Define a method `prime_factorization(n)` that breaks a number down into it's 
# prime factors.

# example: prime_factorization(12) => [2,2,3]

class Integer
  def prime?
    return false if self < 2

    (2...self).none? { |n| self % n == 0 }
  end
end

def prime_factorization(num)
  (2..num).each do |i|
    if (num % i == 0) && i.prime?
      return [i, *prime_factorization(num / i)]
    end
  end
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
# the resulting number. Keep repeating until there is only one digit in the 
# result, called the "digital root". **Do NOT use the built in `Integer#to_s`
# or `Integer#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  digital_root(num - 9)
end

# def digital_root(num)
#   num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
# end

# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs_sum(n - 1) + fibs_sum(n - 2) + 1
end

# def fibs_sum(n)
#   return 0 if n == 0
#   return 1 if n == 1
#   return 1 if n == 2

#   sum = fibs_sum(n - 1) + fibs_sum(n - 2)
#   sum + fibs_sum(n - 1)

# end

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return false if string.length == 0
  return false if key.length == 0
  return true if key.length == 1 && key[0] == string[0]
  if string[0] == key[0]
    string_include_key?(string[1..-1], key[1..-1])
  else
    string_include_key?(string[1..-1], key)
  end
end

###############
# RECURSION   #
###############

# What is Recursion?


# What do we need to write a useful recursive method?
# 1. Base case
# 2. Inductive step

# return array containing the first n fibs
# examples

# fibs(0) => []
# fibs(1) => [0]
# fibs(7) => [0, 1, 1, 2, 3, 5, 8]

def fibs(n) # => 4
    # USING MULTIPLE BASE CASES
    # return [] if n == 0
    # return [0] if n == 1
    # return [0,1] if n == 2
    
    # USING SINGLE BASE CASE
    return [0,1].take(n) if n <= 2

    # MEMOIZING THE RECURSIVE CALL
    prev_fib = fibs(n-1) # => [0,1,1]

    next_fib = prev_fib[-1] + prev_fib[-2] # 1 + 0 = 1

    prev_fib << next_fib
end


class Array 
    def quicksort
        # Works by selecting a pivot element from the array, then splitting the 
        # array in 2: 
        #   - 'left' : containing all elements less than than the pivot
        #   - 'right' : containing all elements more than or equal to the pivot
        #               (excluding the pivot)
        # Quicksort is called recursively on these arrays to sort them,
        # returning the sorted arrays concatenated with the pivot

        # 1. what is the base case?

        # e.g [3,2,1,4].quicksort
        
        return self.dup if self.length <= 1

        pivot = self.first # => 3
        left = [] # => [2,1]
        right = [] # => [4]

        self.drop(1).each do |el|
            if el < pivot
                left << el
            else 
                right << el
            end
        end

        # left_sorted = left.quicksort # => [1,2]
        # right_sorted = right.quicksort # [4]

        left.quicksort + [pivot] + right.quicksort # = > [1,2] + [3] + [4] = [1,2,3,4]
    end
end

# check this link https://github.com/appacademy/cohort-resources/tree/master/assessment_tips/a01
# https://github.com/appacademy/aa-practice-test-generator/tree/master/problems

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)

    if accumulator.nil?
      i = 1
    else
      i = 0
    end

    
    while i < self.length
      accumulator = block.call(accumulator,self[i])
      i += 1
    end

  end
  accumulator
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(pos_prime)

  (0...pos_prime).each do |num|
    if pos_prime%num == 0 
      return false
    end
  end

  return true
end


def primes(num)
  count = 0; 
  i = 2; 
  arr = []

  while count < num
    if is_prime?(i)
      arr.push(i)
      count += 1;
    en
      i += 1  
  end

  return arr
end

# p primes(5)
# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2

   arr = factorials_rec(num-1);
   arr.push((num)*arr[-1])
   return arr
end

# p factorials_rec(4)
class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    # debugger
    dups_hash =  Hash.new([]) 

    self.each do |el,idx| #self.each do |el,idx|
      dups_hash[el].push(idx)
    end

    dups_hash.select {|k,v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    str_arr = self.chars                                                          
    palindromes = []

    str_arr.each_with_index do |char, idx|
      (idx...self.length).each do |idx1|
        sub_str = self[idx..idx1]
        palindromes.push(sub_str) if sub_str = sub_str.reverse #sub_str=sub_str.reverse 
      end
    end
    # debugger
    return palindromes
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    #this is our base base because we know that if an array is empty or 
    #it has a length of one then it is in fact sorted.
    return self if self.length <= 1
    #we have to make sure that we assign a prc if there is no proc being passed in 
    
    prc ||= Proc.new {|a,b| a<=>b} #exclude

    mid = self.length/2
    left = self[0...mid]
    right = self[mid..-1]

    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    self.merge(left_sorted,right_sorted)
  end

  private
  def self.merge(left, right, &prc)
    merged_arr = []

    until left.empty? || right.empty? 
      if prc.call(left[0],right[0]) == -1 #prc(left[0],right[0])
        merged_arr << left.shift
      else
        merged_arr << right.shift
      end
    end

    return merged_arr + left + right
  end
end
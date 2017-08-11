class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_val = 0
    each_with_index { |ele, i| hash_val += (ele.to_s.ord * i) }
    hash_val
  end
end

class String
  def hash
    hash_val = 0
    chars.each { |char| hash_val += (char.ord + self.index(char)) }
    hash_val
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort.hash
  end
end

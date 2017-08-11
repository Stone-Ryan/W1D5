class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max) { false }
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > @max
    @store[num] = false if @store[num]
  end

  def include?(num)
    return true if @store[num]
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if self.include?(num)
      num
    else
      self[num] << num
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    if self[num].include?(num)
      true
    else
      false
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    if self[num].include?(num)
      true
    else
      false
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    little_arr = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    little_arr.flatten.each { |ele| insert(ele) }
  end
end

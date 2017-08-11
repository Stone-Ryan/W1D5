require_relative 'p02_hashing'

class HashSet
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
    @store[num.hash % num_buckets]
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

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max)
  end

  def insert(num)
    raise "Too big!" if num > max
    @store[num] = true
  end

  def remove(num)
    raise "Too big!" if num > max
    @store[num] = false if @store[num]
  end

  def include?(num)
    @store[num]
  end

end

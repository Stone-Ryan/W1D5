class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if empty?
      nil
    else
      @head.next
    end
  end

  def last
    if empty?
      nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each { |node| return node.val if node.key == key }
  end

  def include?(key)
    any? { |node| node.key == key }
  end

  def append(key, val)
    new_ele = Node.new(key, val)
    @tail.prev.next = new_ele
    new_ele.prev = @tail.prev
    new_ele.next = @tail
    @tail.prev = new_ele

    new_ele
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node
      end
    end
  end

  def each(&block)
    current_node = @head.next
    until current_node == @tail
      block.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

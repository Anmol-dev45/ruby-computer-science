class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(key, value)
    return prepend(key, value) if @head.nil?

    cur = @head
    cur = cur.next_node until cur.next_node.nil?
    cur.next_node = Node.new(key, value)
  end

  def prepend(key, value)
    @head = Node.new(key, value, @head)
  end

  def size
    cur = @head
    size = 0
    until cur.nil?
      size += 1
      cur = cur.next_node
    end
    size
  end
end

class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end

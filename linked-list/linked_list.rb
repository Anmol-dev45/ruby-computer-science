require_relative("node")
class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    return prepend(value) if @head.nil?

    cur = @head
    cur = cur.next_node until cur.next_node.nil?
    cur.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
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

  def tail
    cur = @head
    cur = cur.next_node until cur.next_node.nil?
    cur
  end

  def at(index)
    cur = @head
    i = 0
    until cur.nil?
      return cur if index == i

      i += 1
      cur = cur.next_node
    end
    nil
  end

  def pop
    prev = nil
    cur = @head
    until cur.next_node.nil?
      prev = cur
      cur = cur.next_node
    end
    prev.next_node = nil
  end

  def contains?(value)
    cur = @head
    until cur.nil?
      return true if cur.value == value

      cur = cur.next_node
    end
    false
  end

  def find(value)
    cur = @head
    index = 0
    until cur.nil?
      return index if cur.value == value

      index += 1
      cur = cur.next_node
    end
    nil
  end

  def to_s
    str = ""
    return if @head.nil?

    cur = @head
    until cur.nil?
      str += "( #{cur.value} ) -> "
      cur = cur.next_node
    end
    "#{str}nil"
  end
end

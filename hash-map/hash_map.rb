require_relative("linked_list")
class HashMap
  LOAD_FACTOR = 0.75
  CAPACITY = 16
  def initialize
    @load_factor = LOAD_FACTOR
    @buckets = Array.new(CAPACITY) { nil }
  end

  def grow_bucket
    entry_list = entries
    @buckets = Array.new(@buckets.length * 2) { nil }

    puts "line 14 executed"
    entry_list.each do |key_value|
      key, value = key_value
      set(key, value)
    end
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = ((prime_number * hash_code) + char.ord) % @buckets.length }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key)
    @buckets[hash_code] ||= LinkedList.new

    current = @buckets[hash_code].head
    while current
      if current.key == key
        current.value = value
        return
      end
      current = current.next_node
    end

    @buckets[hash_code].append(key, value)
    grow_bucket if length > @buckets.length * @load_factor
  end

  def get(key)
    hash_code = hash(key)
    return nil unless @buckets[hash_code]

    current = @buckets[hash_code].head
    while current
      return current.value if current.key == key

      current = current.next_node
    end
    nil
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    hash_code = hash(key)
    current = @buckets[hash_code]&.head
    previous = nil

    while current
      if current.key == key
        value = current.value
        if previous
          previous.next_node = current.next_node
        else
          @buckets[hash_code].head = current.next_node
        end
        return value
      end
      previous = current
      current = current.next_node
    end
    nil
  end

  def out_of_bound_index
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def length
    @buckets.compact.reduce(0) { |length, bkt| length + bkt.size }
  end

  def clear
    @buckets = Array(16) { nil }
  end

  def keys
    @buckets.compact.each_with_object([]) do |bkt, keys|
      cur = bkt.head
      until cur.nil?
        keys << cur.key
        cur = cur.next_node
      end
    end
  end

  def values
    @buckets.compact.each_with_object([]) do |bkt, values|
      cur = bkt.head
      until cur.nil?
        values << cur.value
        cur = cur.next_node
      end
    end
  end

  def entries
    @buckets.compact.each_with_object([]) do |bkt, entries|
      cur = bkt.head
      until cur.nil?
        entry = [cur.key, cur.value]
        entries << entry
        cur = cur.next_node
      end
    end
  end
end

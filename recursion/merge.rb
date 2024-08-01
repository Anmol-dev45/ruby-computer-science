def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort arr[0...mid]
  right = merge_sort arr[mid..]
  merge left, right
end

def merge(left, right)
  arr = []
  arr << (left.first <= right.first ? left.shift : right.shift) until left.empty? || right.empty?
  arr + left + right
end

def pointer_out_of_array?(pointer, length)
  pointer > length - 1
end

arr = (0..100).to_a.shuffle
puts arr
prev = Time.new
puts merge_sort arr
cur = Time.new

p cur - prev

# My name is Anmol Basnet I am a frontend developer. I am currently learining ruby.

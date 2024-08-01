def fab(num)
  arr = [0, 1]
  (2..num - 1).each do |i|
    arr.push(arr[i - 1] + arr[i - 2])
  end
  arr
end

def fibonacci(num, result = [0, 1])
  if num < 2
    result
  else
    result << (result[-1] + result[-2])
    fibonacci(num - 1, result)
  end
end
p fibonacci 8

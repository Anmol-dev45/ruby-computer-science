require_relative("node")
require_relative("linked_list")

list = LinkedList.new

list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")

puts list
list.prepend("human")
puts list

puts list.head.value
puts list.tail.value
list.pop

puts list
puts list.at(0).value
puts list.tail.value
puts list.contains? "snake"
puts list.find "snake"

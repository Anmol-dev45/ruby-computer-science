require_relative "tree"

bst = Tree.new(Array.new(15) { rand(1..100) })

# Confirm that the tree is balanced
puts "Tree balanced? #{bst.balanced?}"

# Print out all elements in level, pre, post, and in order
puts "Level order: #{bst.level_order}"
puts "Preorder: #{bst.preorder}"
puts "Postorder: #{bst.postorder}"
puts "Inorder: #{bst.inorder}"

# Unbalance the tree by adding several numbers > 100
[101, 102, 103, 104, 105].each { |num| bst.insert(num) }

# Confirm that the tree is unbalanced
puts "Tree balanced after adding >100 numbers? #{bst.balanced?}"

# Balance the tree
bst.rebalance

# Confirm that the tree is balanced
puts "Tree balanced after rebalancing? #{bst.balanced?}"

# Print out all elements in level, pre, post, and in order after rebalancing
puts "Level order: #{bst.level_order}"
puts "Preorder: #{bst.preorder}"
puts "Postorder: #{bst.postorder}"
puts "Inorder: #{bst.inorder}"

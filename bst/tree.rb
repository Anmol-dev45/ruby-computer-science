require_relative "node"
class Tree
  attr_accessor :root

  def initialize(arr = nil)
    @root = build_tree arr&.uniq&.sort
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid + 1..])

    root
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, root = @root)
    return Node.new(data) if root.nil?
    return root if root == Node.new(data)

    if data < root.data
      root.left = insert(data, root.left)
    else
      root.right = insert(data, root.right)
    end

    root
  end

  def sucessor(cur)
    cur = cur.right
    cur = cur.left until cur.nil? && cur.left.nil?
    cur
  end

  def delete(data, root = @root)
    return root if root.nil?

    if data < root.data
      root.left = delete(data, root.left)
    elsif data > root.data
      root.right = delete(data, root.right)
    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      succ = sucessor root
      root.data = succ.data
      data.right = delete(succ.data, data.right)
    end
    root
  end

  def find(data, node = @root)
    return node if node.nil?

    if data < node.data
      find(data, node.left)
    elsif data > node.data
      find(data, node.right)
    else
      node
    end
  end

  def level_order
    arr = []
    que = [@root]
    until que.empty?
      node = que.shift
      if block_given?
        yield(node)
      else
        arr << node.data
      end
      que << node.left if node.left
      que << node.right if node.right
    end
    arr unless block_given?
  end

  def inorder(node = @root, arr = [])
    node.nil? and return arr unless block_given?

    inorder(node.left, arr)
    block_given? ? yield(node) : arr << node.data
    inorder(node.right, arr)
  end

  def preorder(node = @root, arr = [])
    node.nil? and return arr unless block_given?

    block_given? ? yield(node) : arr << node.data
    preorder(node.left, arr)
    preorder(node.right, arr)
  end

  def postorder(node = @root, arr = [])
    node.nil? and return arr unless block_given?

    postorder(node.left, arr)
    postorder(node.right, arr)
    block_given? ? yield(node) : arr << node.data
  end

  def height(node)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1
  end

  def depth(node, root = @root)
    return 0 if node == root

    if node.data < root.data
      depth(node, root.left) + 1
    else
      depth(node, root.right) + 1
    end
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    height_difference = (left_height - right_height).abs

    return false if height_difference > 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    arr = inorder
    @root = build_tree arr
  end
end

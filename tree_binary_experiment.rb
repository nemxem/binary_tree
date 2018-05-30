class Node
  attr_accessor :left, :right, :val
  def initialize (left, right, val)
    @left = left
    @right = right
    @val = val
  end
end

class BinaryTree
  attr_accessor :root
  def initialize ()
    @root = nil
  end
  def add(int)
    obj = Node.new(nil,nil,int)
    @root = _add(@root, obj)
    self
  end
  def _add(root, obj)
    return root = obj if root.nil?
    if obj.val < root.val
      if !root.left
        root.left = obj
      else
        _add(root.left, obj)
      end
    else
      if !root.right
        root.right = obj
      else
        _add(root.right, obj)
      end
    end
    root
  end
  def _exist(root, int)
    return root if int == root.val
    if int < root.val
      return nil if root.left.nil?
      _exist(root.left, int)
    else
      return nil if root.right.nil?
      _exist(root.right, int)
    end
  end
  def exist(int)
    _exist(@root, int)
  end
  def kesu(int)
    return nil if !exist(int)
    _kesu(@root, int)
  end
  def _kesu(node, int)
    if int == node.val
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      node.val = _biggest(node.left).val
      node.left = _delete_max(node.left)
      p node.left
    elsif int < node.val
      node.left = _kesu(node.left, int)
    else
      node.right = _kesu(node.right, int)
    end
    node
  end
  def _biggest(node)
    return node if node.right.nil?
    _biggest(node.right)
  end
  def _delete_max(node)
    return node = node.left if node.right.nil?
    node.right = _delete_max(node.right)
    node
  end
end

root = BinaryTree.new()
root.add(50)
root.add(10)
root.add(20)
root.add(8)
root.add(60)
p root.kesu(50)

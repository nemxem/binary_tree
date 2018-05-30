class Node
    attr_accessor :left, :right, :data
    
    def initialize(left, right, data)
        @left = left
        @right = right
        @data = data
    end
end

class Tree
    attr_accessor :root

    def initialize()
        @root = nil
    end

    private
    def private_add(root, new_node)
        if root.nil? #rootが無かったらrootにnew_nodeを採用
            return root = new_node
        end 
        if new_node.data < root.data #rootのdataとnew_nodeのデータでnew_node左側コース
            if root.left.nil?
                root.left = new_node
            else
                private_add(root.left, new_node)
            end
        elsif new_node.data > root.data #右側コース
            if root.right.nil?
                root.right = new_node
            else
                private_add(root.right, new_node)
            end
        else #すでに存在する数字は動作無し
        end
        root
    end
    

    public
    def add(int)
        new_node = Node.new(nil,nil,int)
        @root = private_add(@root, new_node)
        self
    end
end
    root = Tree.new()
    root.add(2)
    root.add(4)
    root.add(6)
    root.add(5)
    root.add(1)
    root.add(4) #すでに入ってる数字動作しないか確認用
    p root

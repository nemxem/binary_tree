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
        loop do
            p "loop start"
            if root.nil? #rootが無かったらrootにnew_nodeを採用
                p "root = nil"
                root = new_node
                p root
                return root
                p "nil??"
                break
            end 
            if new_node.data < root.data #rootのdataとnew_nodeのデータでnew_node左側コース
                
                if root.left.nil?
                    p "left = nil"
                    root.left = new_node
                    p "left nil"
                    break
                else
                    root = root.left
                end
            elsif new_node.data > root.data #右側コース
                if root.right.nil?
                    p new_node
                    p "right = nil"
                    root.right = new_node
                    p "right nil"
                    break
                else
                    root = root.right
                end
            else #すでに存在する数字は動作無し
                p "equal number"
            end
#        root
        end
    end

    def private_exist(root, int)
        if int == root.data #intがrootのデータと等しい
            return root 
        end
        if int < root.data #intがrootのデータより小さい
            if root.left.nil?
                return nil #左側nil,もう存在しない
            end
            private_exist(root.left, int) #左側に存在する部分についてint探索
        else #intがrootのデータより大きい
            if root.right.nil?
                return nil
            end
            private_exist(root.right, int)
        end
    end

    def private_delete(node, int)
        if int <  node.data
            node.left = private_delete(node.left, int)
        elsif int > node.data
            node.right = private_delete(node.right, int)
        else
            if node.right.nil?
                return node.left
            end
            if node.left.nil?
                return node.right
            end
            node.data = private_max(node.left).data
            node.left = private_delete_max(node.left)
        end   
        node 
    end

    def private_min(node)
        if node.left.nil?
            return node
        end
        private_max(node.left)
    end

    def private_max(node) #指定ノードから右に辿って最大値を知る
        if node.right.nil?
            return node
        end
        private_max(node.right)
    end

    def private_delete_max(node) #指定ノードから右辿って突き当りを削除（突き当りノードをその左の子に置き換え）
        if node.right.nil?
            return node = node.left
        end
        node.right = private_delete_max(node.right)
        node
    end

    def private_print(node)
        root = node
        while node.data.nil? == false do
            p "in the while"
            p node.data
            if node.left.nil?
                p node.data
                private_delete(root, node.data)
                sleep(5)
            else
                p "go to left"
                private_print(node.left)
            end
        end
    end
=begin
    def private_print2(node)
    if !node.nil? then
        if !node.left.nil? then
#            p "go to left"
#            sleep(2)
#            p node.left
            private_print2(node.left)
#            p node.data
#            p "in left before"
#            node = node.left
#            p node.data
#            p "in left after"
#            p node.left
        end
            p node.data
#            p "print data"
        if !node.right.nil? then
#            p "go to right"
#            sleep(2)
#            p node.right
            private_print2(node.right)
#            p node.data
#            p "in right before"
#            node = node.right
#            p node.data
#            p "in right after"
        end
    end
    end
=end    
    
    def private_print2(node)
        p private_min(node).data


    end

    


    public
    def add(int)
        new_node = Node.new(nil,nil,int)
        @root = private_add(@root, new_node)
        p @root 
    end

    def delete(int)
        if private_exist(@root,int).nil?
            return nil
        end 
        private_delete(@root, int)
    end

    def print1()
        private_print(@root)
    end
    
    def print2()
        private_print2(@root)
    end

end
    root = Tree.new()
    root.add(3)
    root.add(4)
#    root.add(6)
#    root.add(5)
#    root.add(2)
#    root.add(0)
#    root.add(1)
#    root.add(4) #すでに入ってる数字動作しないか確認用
#    root.delete(6)
#    root.delete(9) #無い数字削除確認用
    p root
#    root.print()
    root.print2()
    p "complete"

class Tree
    tree = []
    Node = Struct.new(:left_pointer, :center_int, :right_pointer)

#def display #調整段階
#b = 
#for i in 1..10 do

def make(x)
    node = Node.new(nil,x,nil)
    tree << node
end

private
def search(tree, a)
i=0
loop{
    if(tree[i].center_int == a) then
        return i
        break
    end
    i += 1
}
end

private
def insert(x,tree)
# p "追加する数字を入力してください"
# x = gets.to_i
    count = 0
    current_num = tree[0].center_int #tree内のノードのcenter_int
    p "current_num" 
    p current_num
loop{
    destination = judge(x, current_num)
    p "after judge"
    p "destination"
    p destination
    if(destination == 1) then
        p "その数字は二分木上に存在しています"
        break
    elsif(destination == 0) then
        if(check(destination, tree, count) == 0) then
            count = search(tree,current_num) #tree内でcurrent_numを探す 
            if(check(destination, tree, count) == 0) then
                current_num = tree[count].left_pointer #tree内でcurrent_numを渡す
            end
            p "after count search : left"
        elsif(check(destination, tree, count) == 1) then
            count = search(tree,current_num)
            tree[count].left_pointer = x
            node = Node.new(nil, x, nil)
            tree << node
            break
        end 
    elsif(destination == 2) then
        p check(destination, tree, count)
        if(check(destination, tree, count) == 0) then
            p "current_num"
            p current_num
            count = search(tree,current_num)
            p "after count_search" 
            if(check(destination, tree, count) == 0 ) then
                current_num = tree[count].right_pointer
            end
            p "after count search : right"
            p current_num
        elsif(check(destination, tree, count) == 1) then
            count = search(tree,current_num)
        p "test"
            tree[count].right_pointer = x
            node = Node.new(nil, x, nil)
            tree << node
            break
        end 

    end
}
end


private
def judge(input, base)
    if (input < base) then
        return 0 #left
    elsif (input > base) then
        return 2 #right
    else
        return 1 #same number
    end
end

private
def check(destination, tree, count)
    if(destination == 0) then
        if(tree[count].left_pointer == nil) then
            return 1
        else
            return 0
        end
    elsif(destination == 2) then
        if(tree[count].right_pointer == nil) then
            return 1
        else
            return 0
        end
    end
end

def add(x)
    insert(x,tree)
end

end #class

tree1 = Tree.new
tree1.make(3)
tree1.add(4)


=begin クラス化するために消えたメイン
#ノードの最初の処理
p "追加する数字を入力してください"
input = gets.to_i
node = Node.new(nil,input,nil)
tree << node
loop{
p "追加する数字を入力してください、終了時はquitと入力してください"
    input = gets
#    if(input.eql("quit")) then
#        break
#    end
    input_i = input.to_i
    insert(input_i,tree)
 
    p "input_i"
    p input_i
    p tree
}
=end

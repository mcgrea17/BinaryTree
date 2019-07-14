$Output = Array.new

class BinaryTree
    attr_accessor :payload, :left, :right
  
    def initialize(payload, left, right)
      @payload = payload
      @left = left
      @right = right
    end
   

  def self.sort(inputArr)
    if inputArr.length == 0
        return Puts "Empty input Array"
    end
    
    btree = BinaryTree.new(inputArr[0], nil, nil)
    
    inputArr.drop(1).each do |num|
        node = btree
        noHomeFound = true
        while noHomeFound do
          # puts " here #{node.payload} and #{num}"
            if node.payload > num
                if node.left != nil
                    node = node.left
                else
                    node.left = BinaryTree.new(num, nil, nil)
                    noHomeFound = false
                end
            else
                if node.right != nil
                    node = node.right
                else
                    node.right = BinaryTree.new(num, nil, nil)
                    noHomeFound = false
                end
            end
        end
    end   

    return depthTraverse(btree)
  end


  #search for the given number payload of the tree

  def self.depthTraverse(node)
    
    if node == nil
      return $Output
    end

    depthTraverse(node.left)

    # puts node.payload
    $Output << node.payload

    depthTraverse(node.right)

  end
end


  #  puts "Starting with array = [7, 4, 9, 1, 6, 14, 10]"
  #  array = [7, 4, 9, 1, 6, 14, 10]

  #  result = sort(array )
  #  puts result.inspect
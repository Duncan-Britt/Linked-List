class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      node = @head
      while (node.next_node)
        node = node.next_node
      end
      node.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    if @head
      old_head = @head
      @head = Node.new(value)
      @head.next_node = old_head
    else
      @head = Node.new(value)
    end
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new

list.prepend("fug")
list.prepend("the")
list.prepend("what")
list.append("nuggets")
p list.head

# spacer

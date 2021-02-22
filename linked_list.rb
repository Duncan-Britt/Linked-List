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
      prev_head = @head
      @head = Node.new(value)
      @head.next_node = prev_head
    else
      @head = Node.new(value)
    end
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
    else
      node_after = self.at(index)
      node_before = self.at(index-1)
      new_node = Node.new(value)
      node_before.next_node = new_node
      new_node.next_node = node_after
    end
  end

  def remove_at(index)
    if index == 0
      node = @head
      @head = node.next_node
    else
      node_after = self.at(index+1)
      node_before = self.at(index-1)
      removed_node = self.at(index)
      node_before.next_node = node_after
      removed_node
    end
  end

  def size
    if @head
      node = head
      count = 1
      while (node.next_node)
        count += 1
        node = node.next_node
      end
      count
    else
      0
    end
  end

  def tail
    if @head
      node = @head
      while node.next_node
        node = node.next_node
      end
      node
    end
  end

  def at(index)
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    if @head && @head.next_node
      node = @head
      index = 0
      while node.next_node
        node = node.next_node
        index += 1
      end
      node = self.at(index-1)
      popped_node = node.next_node
      node.next_node = nil
      popped_node
    elsif @head
      popped_node = @head
      @head = nil
      popped_node
    end
  end

  def contains?(value)
    node = @head
    while node.next_node
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def to_s
    if @head
      node = @head
      values = []
      output = ""
      while node
        output << "( #{node.value} ) -> "
        node = node.next_node
      end
      output << "nil"
      output
    else
      "List empty"
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

puts "what wil it be? #{list.at(0)}"
puts "should be nil: #{list.tail}"
p list.size
list.prepend("world")
list.prepend("crazy")
list.prepend("hello")
list.append("How goes it?")
p list.head
p list.size
puts "head: #{list.head}"
puts "tail: #{list.tail}"

puts "node at 0: #{list.at(0)}"
puts "node at 2: #{list.at(2)}"
puts "node at 3: #{list.at(3)}"
p list.at(3).value

puts "This list contains 'what'? : #{list.contains?('wha')}"
puts list
list.insert_at("of humans", 3)
puts list

list.remove_at(3)
puts list
# spacer

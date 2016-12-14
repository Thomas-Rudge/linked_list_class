class LinkedList

  attr_reader :head

  def initialize
    @head = Node.new
  end

  def append(data)
    # Adds a new node to the end of the list
    (@head.value.nil? && @head.next.nil?) ? (@head.value = data ; return @head) : nil

    tail_node            = tail
    tail_node.next       = Node.new
    tail_node.next.value = data

    tail_node.next
  end

  def prepend(data)
    # Add a new node to the start of the list
    (@head.value.nil? && @head.next.nil?) ? (@head.value = data ; return @head) : nil

    new_node       = Node.new
    new_node.value = data
    new_node.next  = @head
    @head          = new_node

    new_node
  end

  def size
    # Returns the total number of nodes in the list
    @head.value.nil? ? count = 0 : count = 1
    node = @head

    until node.next.nil?
      node = node.next
      count += 1
    end

    count
  end

  def tail
    # Returns the last node in the list
    node = @head

    until node.next.nil?
      node = node.next
    end

    node
  end

  def pop
    # Removes the last element from the list
    return -1 if (@head.value.nil? && @head.next.nil?)

    popped_node    = tail.clone
    new_tail_index = size - 2

    if new_tail_index < 0
      @head.value = nil
    else
      self[new_tail_index].next = nil
    end

    popped_node
  end

  def contains?(item)
    # True if the item is in the list, else false
    found = false
    node  = @head

    until node.nil?
      if node.value == item
        found = true
        break
      else
        node = node.next
      end
    end

    found
  end

  def find(item)
    # Returns the index of the node containing the data
    index = 0
    node = @head

    until node.nil?
      if node.value == item
        break
      elsif node.next.nil?
        index = -1
        break
      else
        index += 1
        node = node.next
      end
    end

    index
  end

  def to_s
    # Prints the list out to console e.g. ( data ) -> ( data ) -> nil
    sval = ""
    node = @head

    until node.nil?
      sval += "( #{node.value} ) -> "
      node  = node.next
    end

    sval[0..-5]
  end

  def [](index)
    # Returns the node at a given index
    return @head if index == 0
    return -2    if index <  0

    count = 0
    node  = @head

    while true
      break if index == count

      if node.nil?
        node = -1
        break
      else
        node = node.next
        count += 1
      end
    end

    node
  end

  def []=(index, data)
    # Change the value of a node at a given index
    self[index].value = data
  end

  def insert(index, data)
    # Insert a new node at a given index
    new_node           = Node.new
    new_node.value     = data
    new_node.next      = self[index]
    self[index-1].next = new_node

    new_node
  end

  def delete_at(index)
    # Delete a node at a given index
    if index == 0
      deleted_node = @head.clone
      @head = @head.next
    else
      node         = self[index-1]
      deleted_node = node.next.clone
      node.next    = node.next.next
    end

    deleted_node
  end

  alias_method :at, :[]
  alias_method :amend, :[]=
end

class Node

  attr_accessor :value, :next

  def initialize
    @value = nil
    @next = nil
  end
end

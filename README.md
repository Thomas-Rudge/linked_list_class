# Linked List Objects
A linked list data structure implemented through classes in Ruby.

```ruby
require 'linked_list'

llist = LinkedList.new

# OR

llist = L[]

# OR adding items on creation
# These all do the same thing...

llist = LinkedList.new(1, 2, 3)

# OR

llist = L[1, 2, 3]

```
Adding items to the list...

```ruby
llist.append(123456)
 => #<Node:0x00000000d09788 @value=123456, @next=nil>

llist << 123456 # Does the same as above
 => #<Node:0x00000000d09788 @value=123456, @next=nil>

llist.prepend("Hello World")
 => #<Node:0x00000000cfdc58 @value="Hello World", @next=#<Node:0x00000000d09788 @value=123456, @next=nil>>

llist >> "Hello World" # Does the same as above
 => #<Node:0x00000000cfdc58 @value="Hello World", @next=#<Node:0x00000000d09788 @value=123456, @next=nil>>

# You can use append and prepend methods with multiple items

stuff_to_add = ["hello", 123, :addMe]
llist.append(*stuff_to_append)
 => ["hello", 123, :addMe]

llist.prepend(1, 2, 3)
 => [1, 2, 3]
```

Query methods...

```ruby
llist.to_s
 => "( Hello World ) -> ( 123456 ) -> ( 9999 ) -> ( [1, 2, 3, 4] ) -> ( Spam )"

llist.size
 => 5

llist.contains? "Eggs"
 => false 

llist.find(9999)
 => 2 

llist.tail
 => #<Node:0x00000000c16290 @value="Spam", @next=nil> 

llist[3]
 => #<Node:0x00000000c086b8 @value=[1, 2, 3, 4], @next=#<Node:0x00000000c16290 @value="Spam", @next=nil>>
```
Amend methods...

```ruby
llist[3] = "Ruby"
 => "Ruby" 

llist.insert(2, {:Demo=>true})
 => {:Demo=>true}

llist.delete_at(1) # Returns a childless version of the deleted node.
 => #<Node:0x00000000d09788 @value=123456, @next=nil>

llist.pop
 => #<Node:0x00000000cec480 @value="Spam", @next=nil> 

llist.pop(3) # Removes the last three nodes
 => nil

llist.to_s
 => "( Hello World ) -> ( {:Demo=>true} ) -> ( 9999 ) -> ( Ruby )"
```

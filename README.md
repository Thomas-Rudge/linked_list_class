# Linked List Objects
A linked list data structure implemented through classes in Ruby.

```ruby
require 'linked_list'

llist = LinkedList.new
```
Adding items to the list...

```ruby
llist.append(123456)
 => #<Node:0x00000000d09788 @value=123456, @next=nil>

llist.prepend("Hello World")
 => #<Node:0x00000000cfdc58 @value="Hello World", @next=#<Node:0x00000000d09788 @value=123456, @next=nil>>
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

llist.to_s
 => "( Hello World ) -> ( {:Demo=>true} ) -> ( 9999 ) -> ( Ruby )"
```

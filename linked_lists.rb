class LinkedList
    attr_accessor :head_node
  
    def initialize
      self.head_node = nil
    end
    
    def append(value)
      if self.head_node.nil?
        self.head_node = Node.new(value, nil)
      else
        last_node = self.head_node
        until(last_node.next_node.nil?)
          last_node = last_node.next_node
        end
        last_node.next_node = Node.new(value, nil)
      end
    end
  
    def prepend(value)
      if self.head_node.nil?
        self.head_node = Node.new(value, nil)
      else
        prev_head = self.head_node
        self.head_node = Node.new(value, prev_head)
      end
    end
  
    def size
      counter = 0
      node = head_node
      until(node.nil?)
        counter += 1
        node = node.next_node
      end
      return counter
    end
  
    def head
      puts head_node.value
    end
  
    def tail
      current = self.head_node
      while current.next_node != nil
        current = current.next_node
      end
      return current.value
    end
  
    def at(index)
      counter = 0
      current = self.head_node
      while counter != index
        counter += 1
        current = current.next_node
      end
      return current.value
    end
  
    def pop
      new_last_item = self.head_node
      until(new_last_item.next_node.next_node.nil?)
        new_last_item = new_last_item.next_node
      end
      new_last_item.next_node = nil
    end
  
    def contains?(value)
      search = self.head_node
      while search != nil
        if search.value == value
          return true
        else
          search = search.next_node
          next
        end
      end
      return false
    end
  
    def find(value)
      look4 = self.head_node
      count = 0
      while look4 != nil
        if look4.value == value
          return count
        else
          count += 1
          look4 = look4.next_node
        end
      end
      return "Value is not in linked list"
    end
  
    def to_s
      head = self.head_node
      while head != nil
        print "(#{head.value}) -> "
        head = head.next_node
      end
    end
    
    private
  
    class Node
      attr_accessor :value, :next_node
      
      def initialize(value, next_node)
        self.value = value
        self.next_node = next_node
      end
    end
  end
  
  ll = LinkedList.new
  ll.append(20)
  ll.append(30)
  ll.append(60)
  ll.prepend(18)
  ll.append(5)
  ll.append(3)
  puts ll.to_s
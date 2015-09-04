class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def max
    
  end
end

class StackQueue
  def initialize
    @queue = MyStack.new
    @shift = MyStack.new
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    until @queue.size == 0
      @shift.push(@queue.pop)
    end
    first_el = @shift.pop
    until @shift.size == 0
      @queue.push(@shift.pop)
    end
    first_el
  end

end

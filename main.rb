class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def append(value)
    new_node = Node.new(value)
    unless @list[@list.length - 1].nil?
      @list[@list.length - 1].next_node = new_node
    end
    @list.push(new_node)
  end

  def prepend(value)
    new_node = Node.new(value, @list[0])
    @list.unshift(new_node)
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[@list.length - 1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
    @list[list.length - 1].next_node = nil
  end

  def contains?(value)
    @list.each do |v|
      return true if v.value == value
    end
    false
  end

  def find(value)
    @list.each_with_index do |v, i|
      return i if v.value == value
    end
    nil
  end

  def to_s
    str = ""
    @list.each do |v|
      str += "( #{v.value} ) -> "
    end
    str += "nil" 
  end

  def insert_at(value, index)
    new_node = Node.new(value, @list[index])
    @list.insert(index, new_node)
    @list[index - 1].next_node = new_node
  end

  def remove_at(index)
    @list.delete_at(index)
    unless index - 1 < 0
      @list[index - 1].next_node = @list[index]
    end
  end

end
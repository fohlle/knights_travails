require_relative "node.rb"
require_relative "one.rb"
require_relative "knight.rb"

class Graph

  attr_reader :node_list, :piece

  def initialize(piece)
    puts "Welcome to Graph"
    @node_list = []
    @piece = piece
  end

  def add_node(value)
    return nil if value.nil?
    node = Node.new(value)
    @node_list << node
    node
  end

  def add_edge(from,to)
    #return nil if find_node(from).nil?
    #return nil if find_node(to).nil?
    #from = find_node(from)
    #to = find_node(to)
    #from.adjacent_nodes << to
    #to.adjacent_nodes << from
    from.adjacent_nodes << to
  end

  def print_nodes
    return nil if @node_list.empty?

    @node_list.each {|n| n.adj_list}
  end

  def find_node(value)
    #node = Node.new(value)
    return nil if value.nil?

    @node_list.each {|n| return n if n.value == value}
    return nil
  end

  def find(start,ending,stack = [])

    node = find_node(start)
    node.visited = 0
    stack.push(node)

    index = 1

    until stack.empty?
      node = stack.shift

      for i in node.adjacent_nodes
        if i.visited.nil?
          num = node.visited
          i.visited = num + 1
          i.source = node
        end
      end

      node.adjacent_nodes.each do |n|
        if n.visited > node.visited
          stack.push(n)
        end
      end

      index += 1

      if node.value == ending
        puts "Node start:#{find_node(start)} Node end:#{node} nr:#{node.visited}"
        test = node

        until test.source.nil?
          puts test
          test = test.source
        end
        puts test
        break
      end

    end

  end

  def test(width)

    array = []
    board = []
    for i in 0...width
      for j in 0...width
        array << [i,j]
        board << add_node([i,j])
      end
    end

    board.each do |n|
      x = n.value[0]
      y = n.value[1]

      @piece.move.each do |move|
        move[0] += x
        move[1] += y
        node = find_node(move)
        add_edge(n,node) if check(move)
      end

    end

  end

  def sort_list
    @node_list.map do |n|
      n.adjacent_nodes.sort! {|a,b| a.value <=> b.value}
   end
  end

  def check(move)
    @node_list.each {|n| return true if n.value == move}
    return false
  end

  def reset_nodes
    @node_list.map do |n|
      n.visited = nil
      n.source = nil
    end
  end

##END
end

graph = Graph.new(Knight.new)

graph.test(8)
graph.sort_list
#graph.print_nodes
graph.find([4,3],[3,3])
graph.reset_nodes
graph.find([3,3],[4,3])

=begin
2,0 2,1 2,2
1,0 1,1 1,2
0,0 0,1 0,2
=end


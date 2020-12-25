
class Node

  attr_reader :value
  attr_accessor :adjacent_nodes, :visited, :source

  def initialize(value)
    @value = value
    @adjacent_nodes = []
    @visited = nil
    @source = nil
  end

  #def add_edge(node)
  #  @adjacent_nodes << node
  #end

  def to_s
    "#{@value}"
  end

  def adj_list
    return nil if @adjacent_nodes.empty?
    #puts "Adjecent from #{@value} is:"
    arr = []
    @adjacent_nodes.each {|node| arr.push(node.value)}
    puts "#{@value} adj:#{arr}"
  end

end
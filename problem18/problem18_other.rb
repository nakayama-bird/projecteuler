class Node
  include Comparable

  attr_reader :value, :level, :index
  attr_accessor :left, :right

  def initialize(value, level, index)
    @value = value
    @level = level
    @index = index
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    @value.to_s
  end

  def inspect
    format('#<Node: %d#%d>', @value, @level)
  end
end

class Route < Array
  include Comparable

  def total_value
    @total_value ||= inject(0) { |sum, node| sum + node.value }
  end

  def current
    last
  end

  def branches
    unless @branches
      @branches = []
      if current
        if current.left
          left = Route.new(self).push(current.left)
          @branches.push left
        end
        if current.right
          right = Route.new(self).push(current.right)
          @branches.push right
        end
      end
    end
    @branches
  end

  def <=>(other)
    total_value <=> other.total_value
  end

  def to_s
    format('#<Route: %d#%d [%s]', total_value, current.level, map { |node| node.to_s }.join(', '))
  end

  def inspect
    to_s
  end
end

def maketree(treelist)
  top = Node.new(treelist.first.first, 1, 0)
  parents = [top]

  treelist[1..treelist.length].each_with_index do |vals, i|
    level = i + 1
    childs = []
    vals.each_with_index do |val, j|
      node = Node.new(val, level + 1, j)
      parents[j].left = node if j < parents.length
      parents[j - 1].right = node if 0 < j
      childs.push node
    end
    parents = childs
  end
  top
end

treelist = []
text = File.read('triangle.txt')
lines = text.split("\n")
for line in lines
  values = line.split(/\s+/)
  treelist.push values.map(&:to_i)
end

root = maketree(treelist)
routes = [Route.new.push(root)]
total_pruned = 0

max_level = treelist.length
(2..max_level).each do |level|
  routes = routes.inject([]) { |list, r| list + r.branches }

  pruning = []
  treelist[level - 1].each_with_index do |_val, i|
    overlapping = routes.find_all { |r| r.current.index == i }

    if 1 < overlapping.length
      overlapping -= [overlapping.max]
      pruning += overlapping
    end
  end

  pruned = pruning.length * 2**(max_level - level)
  total_pruned += pruned
  routes -= pruning

  puts "#{level}: routes = #{routes.length}, cut = #{pruning.length}"
end

puts
puts "#{total_pruned.to_i}/#{2**(max_level - 1)} routes were cut."
puts "active routes: #{routes.length}."
puts "Maximum total route: #{routes.max.inspect}"

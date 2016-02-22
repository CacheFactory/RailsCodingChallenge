require 'cuboid'
#    e-------f
#   /|      /|
#  / |     / |
# a--|----b  |
# |  g----|--h
# | /     | /
# c-------d

# x -
# y |
# z /

class Vertex
  attr_accessor :x, :y, :z, :point_position

  def initialize(x, y, z, point_position = nil)
    @x = x 
    @y = y
    @z = z
    @point_position = point_position
  end

  def within?(cuboid)
    cuboid.vertices.all? { |vertex| inside_vertex?(vertex) }
  end

  private

  def inside_vertex?(vertex)
    case vertex.point_position
    when :a
      @x >= vertex.x && @y <= vertex.y && @z <= vertex.z
    when :b
      @x <= vertex.x && @y <= vertex.y && @z <= vertex.z
    when :c
      @x >= vertex.x && @y >= vertex.y && @z <= vertex.z
    when :d
      @x <= vertex.x && @y >= vertex.y && @z <= vertex.z
    when :e 
      @x >= vertex.x && @y <= vertex.y && @z >= vertex.z
    when :f
      @x <= vertex.x && @y <= vertex.y && @z >= vertex.z
    when :g
      @x >= vertex.x && @y >= vertex.y && @z >= vertex.z
    when :h
      @x <= vertex.x && @y >= vertex.y && @z >= vertex.z
    else
      false
    end
  end
end
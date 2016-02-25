require 'cuboid'

  # G == ORIGIN

  #    e-------f
  #   /|      /|
  #  / |     / |
  # a--|----b  |
  # |  g----|--h
  # | /     | /
  # c-------d

  # y -
  # z |
  # x /


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
      @y >= vertex.y && @z <= vertex.z && @x <= vertex.x
    when :b
      @y <= vertex.y && @z <= vertex.z && @x <= vertex.x
    when :c
      @y >= vertex.y && @z >= vertex.z && @x <= vertex.x
    when :d
      @y <= vertex.y && @z >= vertex.z && @x <= vertex.x
    when :e 
      @y >= vertex.y && @z <= vertex.z && @x >= vertex.x
    when :f
      @y <= vertex.y && @z <= vertex.z && @x >= vertex.x
    when :g
      @y >= vertex.y && @z >= vertex.z && @x >= vertex.x
    when :h
      @y <= vertex.y && @z >= vertex.z && @x >= vertex.x
    else
      false
    end
  end
end
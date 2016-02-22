
class Cuboid

  def initialize(x, y, z, height, length, width)
    @x = x
    @y = y
    @z = z
    @length = length
    @width = width
    @height = height
  end  

  def move_to!(x, y, z)
    @x = x
    @y = y
    @z = z
    @vertices = nil
    true
  end
  
  def vertices
    return @vertices if @vertices
    vertices = []

    # G == ORIGIN

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

    vertices.push Vertex.new(@x, @y + @height, @z + @length, :a)
    vertices.push Vertex.new(@x + @width, @y + @height, @z + @length, :b)

    vertices.push Vertex.new(@x, @y, @z + @length, :c)
    vertices.push Vertex.new(@x + @width, @y, @z + @length, :d)

    vertices.push Vertex.new(@x, @y + @height, @z, :e)
    vertices.push Vertex.new(@x + @width, @y + @height, @z, :f)

    vertices.push Vertex.new(@x, @y, @z, :g) # g ORIGIN
    vertices.push Vertex.new(@x + @width, @y, @z, :h)

    @vertices = vertices
  end
  
  def intersects?(other_cuboid)
    vertices.any? { |vertex| vertex.within?(other_cuboid) }
  end

end

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

    # y -
    # z |
    # x /

    vertices.push Vertex.new(@x + @length, @y , @z + @height, :a)
    vertices.push Vertex.new(@x + @length, @y + @width, @z + @height, :b)
    
    vertices.push Vertex.new(@x + @length, @y, @z, :c)
    vertices.push Vertex.new(@x + @length, @y + @width, @z, :d)
    
    vertices.push Vertex.new(@x, @y, @z + @height, :e)
    vertices.push Vertex.new(@x, @y + @width, @z + @height, :f)
    
    vertices.push Vertex.new(@x, @y, @z, :g) # ORIGIN
    vertices.push Vertex.new(@x, @y + @width, @z, :h)


    @vertices = vertices
  end
  
  def intersects?(other_cuboid)
    vertices.any? { |vertex| vertex.within?(other_cuboid) }
  end

end
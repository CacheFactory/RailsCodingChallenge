require 'vertex'

describe Vertex do
 
  describe 'within?' do
    
    it "returns true for a point within a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(1, 1, 1)
      expect(vertex.within?(cuboid)).to eq(true)
    end

    it "returns true for a point on a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(0, 0, 0)
      expect(vertex.within?(cuboid)).to eq(true)
    end

    it "returns true for a point on a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(10, 10, 10)
      expect(vertex.within?(cuboid)).to eq(true)
    end

    it "returns false for a point outside of a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(-1, -1, -1)
      expect(vertex.within?(cuboid)).to eq(false)
    end

    it "returns false for a point high outside of a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(11, 11, 11)
      expect(vertex.within?(cuboid)).to eq(false)
    end

    it "returns false for a point close to the outside of a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(11, 10, 11)
      expect(vertex.within?(cuboid)).to eq(false)
    end

    it "returns false for a point close to the outside of a cuboid" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      vertex = Vertex.new(11, 10, 10)
      expect(vertex.within?(cuboid)).to eq(false)
    end

  end

end

require 'pry'
require 'cuboid'

describe Cuboid do
 
  let(:subject) {described_class.new(0, 0, 0, 10, 10, 10)}

  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3)).to be true
    end

    it "changes the vertices" do
      verticies = subject.vertices
      subject.move_to!(1,2,3)
      expect(subject.vertices).to_not eq(verticies)
      expect(subject.vertices.first.x).to eq(11)
      expect(subject.vertices.first.y).to eq(2)
      expect(subject.vertices.first.z).to eq(13)
    end
  end    
  
  describe "intersects?" do
    it "returns true when two cuboid intersect" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      cuboid_2 = Cuboid.new(1, 1, 1, 10, 10, 10)

      expect(cuboid.intersects?(cuboid_2)).to be true
      expect(cuboid_2.intersects?(cuboid)).to be true
    end

    it "returns false when two cuboid do not intersect" do
      cuboid = Cuboid.new(0, 0, 0, 10, 10, 10)
      cuboid_2 = Cuboid.new(15, 15, 15, 10, 10, 10)

      expect(cuboid.intersects?(cuboid_2)).to be false
      expect(cuboid_2.intersects?(cuboid)).to be false
    end
  end

end

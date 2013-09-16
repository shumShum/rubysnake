class Egg < GameObject
  attr_accessor :x, :y

  def setup
    @image = Image["egg.png"] rescue nil
    reburn
  end

  def reburn
    @x = rand(50)*10 + 10
    @y = rand(50)*10 + 10
  end

end
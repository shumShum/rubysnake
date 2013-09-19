class Bush < GameObject

  def setup
    @image = Image["bush.png"] rescue nil
    @x_center = rand(100)*8 + 100
    @y_center = rand(100)*5 + 60

    @radius = rand(20) * 10 + 10
    @angle = 0
    @angle_velocity = 5.0/@radius
  end

  def move
    @angle = (@angle + @angle_velocity)%6.28
    @x = @x_center + Math.cos(@angle)*@radius
    @y = @y_center + Math.sin(@angle)*@radius
  end

end

class BushFactory 
  attr_accessor :bushs

  def initialize
    @bushs = []
  end

  def create_bush
    10.times do
      ver = rand(5) 
      if ver == 1 
        bush = Bush.create 
        @bushs << bush 
      end 
    end
  end

  def move_bush
    @bushs.each do |bush|
      bush.move
    end
  end

  def get_bush(x, y)
    @bushs.each do |bush|
      if (x < bush.x + 30) && (x > bush.x - 30) && (y > bush.y - 30) && (y < bush.y + 30)
        return bush
      end
    end
    nil
  end
end
class Snake < GameObject
  attr_accessor :x, :y, :egg

  def setup
    @image = Image["snake.png"] rescue nil

    @x = 180
    @y = 180
    @max_height = $window.height
    @max_width = $window.width
    @step = 15

    @angle = 0
    @rotate = 0.349
  end

  def move
    move_up if holding?(:up)
    move_down if holding?(:down)
    move_right if holding?(:right)
    move_left if holding?(:left)
    vel_x = @step * Math.cos(@angle)
    vel_y = @step * Math.sin(@angle)    
    @x += vel_x if @x + vel_x < @max_width
    @y += vel_y if @y + vel_y < @max_height
  end

  def move_up
    case quadrant
    when 1,4
      @angle = (@angle - @rotate)%6.28
    when 2,3
      @angle = (@angle + @rotate)%6.28
    end
  end

  def move_down
    case quadrant
    when 1,4
      @angle = (@angle + @rotate)%6.28
    when 2,3
      @angle = (@angle - @rotate)%6.28
    end
  end

  def move_right
    case quadrant
    when 1,2
      @angle = (@angle - @rotate)%6.28
    when 3,4
      @angle = (@angle + @rotate)%6.28
    end
  end

  def move_left
    case quadrant
    when 1,2
      @angle = (@angle + @rotate)%6.28
    when 3,4
      @angle = (@angle - @rotate)%6.28
    end
  end

  private

  def quadrant
    (@angle/1.571).floor + 1 
  end

end
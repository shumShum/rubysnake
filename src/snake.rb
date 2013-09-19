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

    @child = 'tail'
  end

  def move
    @child.move(@x, @y) if @child != 'tail'

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

  def grow_up
    if @child != 'tail'
      @child.grow_up
    else
      @child = SnakeItem.create(x: @x, y: @y)
    end
  end

  def slowed
    @step -= 5
  end

  def fasted
    @step += 5
  end

  def crash
    @x = rand(10) * 99 + 20
    @y = rand(10) * 63 + 20
    @child.crash if @child != 'tail' 
  end

  private

  def quadrant
    (@angle/1.571).floor + 1 
  end

end
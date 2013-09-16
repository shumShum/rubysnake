class Snake < GameObject
  attr_accessor :x, :y, :egg

  def setup
    self.input = { 
      up: :move_up,
      down: :move_down, 
      right: :move_right, 
      left: :move_left }

    @image = Image["snake.png"] rescue nil

    @x = 180
    @y = 180
    @max_height = $window.height
    @max_width = $window.width
    @step = 15
  end

  def move    
    case @direction
    when "up"
      @y -= @step if @y > 0
    when "down"
      @y += @step if @y < @max_height
    when "right"
      @x += @step if @x < @max_width
    when "left"
      @x -= @step if @x > 0
    end
  end

  def move_up
    if @direction != "down"
      @direction = "up"
    end
  end

  def move_down
    if @direction != "up"
      @direction = "down"
    end
  end

  def move_right
    if @direction != "left"
      @direction = "right"
    end
  end

  def move_left
    if @direction != "right"
      @direction = "left"
    end
  end

end
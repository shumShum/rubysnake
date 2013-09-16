class Snake < GameObject
  trait :timer

  attr_accessor :x, :y, :egg

  def setup
    self.input = { 
      up: :move_up,
      down: :move_down, 
      right: :move_right, 
      left: :move_left }

    @image = Image["snake.png"] rescue nil

    @x = 200
    @y = 200
    @max_height = $window.height
    @max_width = $window.width
  end

  def move(direction)
    case direction
    when "up"
      @y -= 10 if @y > 0
    when "down"
      @y += 10 if @y < @max_height
    when "right"
      @x += 10 if @x < @max_width
    when "left"
      @x -= 10 if @x > 0
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

  def update
    move(@direction)
    if (@x < @egg.x + 25) && (@x > @egg.x - 25) && (@y > @egg.y - 25) && (@y < @egg.y + 25)
      @egg.to_die
    end
  end

end
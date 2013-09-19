class SnakeItem < GameObject
  attr_accessor :x, :y

  def setup
    @image = Image["snake.png"] rescue nil

    @child = 'tail'
    @new_born = true
  end

  def move(x,y)
    @child.move(@x, @y) if @child != 'tail'

    if @new_born
      @new_born = false
    else
      @x = x
      @y = y
    end
  end

  def grow_up
    if @child != 'tail'
      @child.grow_up
    else
      @child = SnakeItem.create(x: @x, y: @y)
    end
  end

  def crash
    @x = rand(10) * 99 + 20
    @y = rand(10) * 63 + 20
    @child.crash if @child != 'tail' 
  end

end
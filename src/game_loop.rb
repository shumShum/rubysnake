class GameLoop < GameObject
  trait :timer
  attr_accessor :egg, :snake, :score

  def setup
    @snake = Snake.create
    @egg = Egg.create
    @score = Score.create

    every(50) { loop_iteration }
  end

  def loop_iteration
    @snake.move
    if (@snake.x < @egg.x + 15) && (@snake.x > @egg.x - 15) && (@snake.y > @egg.y - 15) && (@snake.y < @egg.y + 15)
      @egg.reburn
      @score.up
    end
  end

end
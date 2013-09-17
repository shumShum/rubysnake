class GameLoop < GameObject
  trait :timer
  attr_accessor :egg, :snake, :score

  def setup
    @snake = Snake.create
    
    @food_factory = FoodFactory.new
    @food_factory.create_food(Egg)

    @bush_factory = BushFactory.new
    @bush_factory.create_bush
    
    @score = Score.create

    every(50) { loop_iteration }
    every(3000) { create_bonus_egg }
  end

  def loop_iteration
    @snake.move
    @food = @food_factory.get_food(@snake.x, @snake.y)
    if !@food.nil? 
      @food.eat
      send @food.effect  
    end

    @bush_factory.move_bush
  end

  def create_bonus_egg
    ver = rand(9)
    @food_factory.create_food(BadEgg) if ver == 1
    @food_factory.create_food(FastEgg) if ver == 2
  end

  def grow_up
    @snake.grow_up
    @score.up
  end

  def slower
    @snake.slowed
  end

  def faster
    @snake.fasted
  end

end
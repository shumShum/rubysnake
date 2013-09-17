class FoodFactory
  attr_accessor :foods

  def initialize
    @foods = {}
  end

  def create_food(food_class)
    new_food = food_class.create
    self.foods[food_class.to_s.downcase] ||= []
    self.foods[food_class.to_s.downcase] << new_food
  end

  def get_food(x,y)
    @foods.each_pair do |key, value|
      value.each do |food|
        if (x < food.x + 15) && (x > food.x - 15) && (y > food.y - 15) && (y < food.y + 15)
          return food
        end
      end
    end
    nil
  end

end
class Food < GameObject
  trait :timer
  attr_accessor :x, :y

  def setup
    reburn
    every(5000) { reburn }
  end

  def reburn
    @x = rand(50)*19 + 30
    @y = rand(50)*12 + 30
  end

  def eat
    reburn
  end

  def effect
  end

end
class Egg < GameObject
  trait :timer

  attr_accessor :x, :y, :die

  def setup
    @image = Image["egg.png"] rescue nil

    @x = 200
    @y = 200
    @die = false
  end

  def to_die
    @die = true
  end

  def update
    if @die
      @x = rand(50)*10 + 10
      @y = rand(50)*10 + 10
      @die = false
    end
  end

end
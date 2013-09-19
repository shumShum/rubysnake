class Score < GameObject
  attr_accessor :value, :snake

  def setup
    @value = 0
    draw_text
  end

  def up
    @value += 1
    @text.destroy
    draw_text
  end

  def draw_text
    @text = Text.create("Eggs collect: #{@value}", :x => 850, :y => 605, :size => 15, :align => :center)
  end

  def out_final_score
    Text.create("Your score - #{@value} eggs!", :x => 250, :y => 240, :size => 30, :align => :center)
  end

end
class MenuState < GameState
  
  def initialize
    super 
    
    SimpleMenu.create(
      :menu_items => {"Start Game" => :start_game, "Quit" => :exit}, 
      :size => 20,
      :factor => 3,
      :padding => 10
    )
    
    # $window.reset_game
  end

  def start_game
    switch_game_state(RunGame)
  end
  
end

class Intro < GameState
  trait :timer
  
  def setup
    on_input([:space, :esc, :enter, :backspace, :gamepad_button_1, :return]) { switch_game_state(MenuState) }
    GameObject.create(:image => Image["intro.png"], :x => 50, :y => 50, :rotation_center => :top_left)
    Text.create("RubySnake V1.0", :x => 400, :y => 240, :size => 30, :align => :center)
    Text.create("by Shum, 2013", :x => 600, :y => 280, :size => 15, :align => :center)
  end
  
  def draw
    fill(Color::BLACK)
    super
  end

end

class RunGame < GameState
  trait :timer
  
  def setup
    self.input = { escape: :reset }
    @loop = GameLoop.create
  end

  def reset
    switch_game_state(MenuState)
  end

  def draw
    fill_gradient(:from => Color::CYAN, :to => Color::BLUE)
    super
  end

end
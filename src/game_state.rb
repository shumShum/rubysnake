class MenuState < GameState
  
  def initialize
    super 
    
    SimpleMenu.create(
      :menu_items => {"Start Game" => :start_game, "Quit" => :exit}, 
      :size => 20,
      :factor => 3,
      :padding => 10
    )
    
    $window.reset_game
  end

  def start_game
    $window.start
  end
  
end

class Intro < GameState
  trait :timer
  
  def setup
    on_input([:space, :esc, :enter, :backspace, :gamepad_button_1, :return]) { switch_game_state(MenuState) }
    GameObject.create(:image => Image["intro.png"], :x => 0, :y => 0, :rotation_center => :top_left)
  end
  
  def draw
    fill(Color::RED)
    super
  end

end
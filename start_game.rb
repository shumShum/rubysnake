require 'rubygems'
require 'chingu'
require 'mime/types'
require 'texplay'

ENV['PATH'] = File.join(ROOT,"lib") + ";" + ENV['PATH']

include Gosu
include Chingu

require_all File.join(ROOT, "src")

class GameWindow < Window
  
  def initialize
    super(1000,640)
  end

  def setup
    self.factor = 2
    reset_game
    @last_level = nil
    
    push_game_state(Intro)
  end

  def reset_game
    
  end

  def start
    
  end
  
end

GameWindow.new.show
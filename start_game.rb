require 'rubygems'
require 'chingu'
require 'mime/types'
require 'texplay'

ENV['PATH'] = File.join(ROOT,"lib") + ";" + ENV['PATH']

include Gosu
include Chingu

require_all File.join(ROOT, "src")

class Window < Chingu::Window
  
  def initialize
    super(1000,640)
  end
  
end

Window.new.show
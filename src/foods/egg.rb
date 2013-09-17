class Egg < Food

  def setup
    @image = Image["egg.png"] rescue nil
    super
  end

  def effect
    :grow_up
  end

end
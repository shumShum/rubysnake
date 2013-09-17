class FastEgg < Food

  def setup
    @image = Image["fast_egg.png"] rescue nil
    super
  end

  def effect
    :faster
  end

end
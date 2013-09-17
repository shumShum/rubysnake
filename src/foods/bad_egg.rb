class BadEgg < Food

  def setup
    super
    @image = Image["bad_egg.png"] rescue nil
  end

  def effect
    :slower
  end

end
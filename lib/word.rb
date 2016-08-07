class Word
  attr_reader :index, :word, :lx, :ly, :rx, :ry

  def initialize(args)
    @index = args[:index]
    @word  = args[:word]
    @lx    = args[:lx]
    @ly    = args[:ly]
    @rx    = args[:rx]
    @ry    = args[:ry]
  end

end

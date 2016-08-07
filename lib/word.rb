class Word
  attr_reader :word, :lx, :ly, :rx, :ry

  def initialize(word_line)
    word, lx, ly, rx, ry = word_line.split(" ")
    @word = word
    @lx = lx.to_i
    @ly = ly.to_i
    @rx = rx.to_i
    @ry = ry.to_i
  end

end

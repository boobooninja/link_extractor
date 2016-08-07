class Page
  attr_reader :word_count

  def initialize
    @word_count = 0
    @words = []
  end

  def word_count=(num)
    @word_count = num
  end

  def add_word(word_line)
    @words << Word.new(word_line)
  end

  def parse!
    parse_string = @words.map { |w| w.word }.join(" ") # This is a test page . It contains a link : example . com
    # TODO: use various regexp to find matches
  end

end

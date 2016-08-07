class Page
  include TLD
  attr_accessor :word_count

  def initialize
    @word_count = 0
    @words = {}
    @parse_string = ""

    @match_count = 0
    @matches = []
  end

  def add_word(word_line)
    word, lx, ly, rx, ry = word_line.split(" ")
    word_index = @parse_string.length
    @parse_string += "#{word} "
    @words[word_index] = Word.new({
      index: word_index,
      word: word,
      lx: lx.to_i,
      ly: ly.to_i,
      rx: rx.to_i,
      ry: ry.to_i
    })
  end

  def parse
    check_for_links(@parse_string)
    yield @match_count
    @matches.each do |match|
      yield match
    end
  end

  private

  def link_regexp
    @link_regexp ||= Regexp.new('(([\w+\-]( . )?)+ @ [a-z\d\-]+( \. [a-z]+)* \. [a-z]+|(((http(s)? : \/ \/ )?|[^@ ])([a-zA-Z0-9]+( \. ([a-z]+))+)))')
  end

  def check_for_links(parse_string)
    matches = parse_string.scan(link_regexp)
    matching_indexes = parse_string.enum_for(:scan, link_regexp).map { Regexp.last_match.begin(0)}

    matches.each do |match|
      process_match(match, matching_indexes.shift)
    end
  end

  def process_match(match, index)
    link_parts = match[0].split(" ")
    tld = link_parts[-1] && link_parts[-1].upcase
    link = link_parts.join("")

    if link && tlds[tld] # valid tld
      found_words = []

      link_parts.each do |word|
        found_word = @words[index]
        found_words << found_word
        index = index + word.length + 1
      end

      first = found_words[0]
      last = found_words[-1]

      @match_count += 1
      @matches << "#{link} #{first.lx} #{first.ly} #{last.rx} #{last.ry}"
    end
  end

end

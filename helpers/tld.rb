module TLD
  def tlds
    @tlds ||= Hash[ File.read('helpers/tld.txt').split("\n").map{|tld| [tld,tld] } ]
  end
end

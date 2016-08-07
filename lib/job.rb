class Job
  attr_reader :page_count

  def initialize
    @page_count = 0
    @pages = {}
    @current_page_number = 0
  end

  def page_count=(num)
    @page_count = num
    @page_count.times do |i|
      @pages[i + 1] = Page.new()
    end
  end

  def next_page!
    @current_page_number += 1 if @current_page_number <= @page_count
  end

  def page
    @pages[@current_page_number]
  end
end

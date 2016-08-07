class Job
  attr_accessor :page_count

  def initialize
    @page_count = 0
    @pages = []
    @current_page_number = 0
  end

  def new_page
    @pages << Page.new()
    @current_page_number = @pages.length - 1
  end

  def page
    @pages[@current_page_number]
  end
end

class Parse

  def initialize(input = STDIN, output = STDOUT)
    @input = input
    @output = output

    @job = Job.new()
  end

  def execute!
    @job.page_count = @input.gets.to_i

    @job.page_count.times do
      @job.new_page
      process_page
    end

    @job.pages.each do |page|
      @output.puts(page.match_count)
      page.matches.each do |match|
        @output.puts(match)
      end
    end
  end

  private

  def process_page
    @job.page.word_count = @input.gets.to_i

    @job.page.word_count.times do
      @job.page.add_word @input.gets
    end

    @job.page.parse
  end

end

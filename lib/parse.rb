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
  end

  private

  def process_page
    @job.page.word_count = @input.gets.to_i

    @job.page.word_count.times do
      @job.page.add_word @input.gets
    end

    @job.page.parse do |line|
      @output.puts(line)
    end
  end

end

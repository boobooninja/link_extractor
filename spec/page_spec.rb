require 'spec_helper'

describe Page do

  let(:word_line) { "This 10 10 30 20" }

  it { should respond_to :word_count }
  it { should respond_to :word_count= }

  describe "#add_word" do
    it "adds a Word to @words" do
      expect(subject.instance_variable_get(:@words).length).to eq(0)
      subject.add_word(word_line)
      expect(subject.instance_variable_get(:@words).length).to eq(1)
    end
  end

  describe "#parse!" do
    before do
      subject.add_word(word_line)
      subject.add_word(word_line)
    end

    it "joins the words and parses them" do
      # TODO: finish parse method
      expect(subject.parse!).to eq("This This")
    end
  end

end

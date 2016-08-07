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

  describe "#parse" do
    before do
      subject.add_word("example 270 10 300 20")
      subject.add_word(". 300 10 310 20")
      subject.add_word("com 310 10 320 20")
    end

    describe "checks for links within the text and yields to a block" do
      specify {
        expect {
          |b| subject.parse &b
        }.to yield_successive_args(1, "example.com 270 10 320 20")
      }
    end
  end

end

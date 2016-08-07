require 'spec_helper'

describe Word do

  let(:word_line) { "This 10 10 30 20" }

  subject { Word.new(word_line) }

  it { should respond_to :word }
  it { should respond_to :lx }
  it { should respond_to :ly }
  it { should respond_to :rx }
  it { should respond_to :ry }

  describe "initialize" do
    it "takes a word_line and returns a new Word" do
      expect(Word.new(word_line)).to be_a(Word)
    end
  end

end

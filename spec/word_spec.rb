require 'spec_helper'

describe Word do

  let(:word_args) { {
    index: 0,
    word: "This",
    lx: 10,
    ly: 10,
    rx: 30,
    ry: 20
  } }

  subject { Word.new(word_args) }

  it { should respond_to :index }
  it { should respond_to :word }
  it { should respond_to :lx }
  it { should respond_to :ly }
  it { should respond_to :rx }
  it { should respond_to :ry }

  describe "initialize" do
    it "takes word args and returns a new Word" do
      expect(Word.new(word_args)).to be_a(Word)
    end
  end

end

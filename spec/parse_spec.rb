require 'spec_helper'

describe "Parse" do
  describe "#execute!" do
    it "works" do
      string_io = StringIO.new

      Parse.new(
        File.open('spec/support/input.txt'),
        string_io
      ).execute!

      expect(string_io.string).to eq(File.read('spec/support/output.txt'))
    end
  end
end

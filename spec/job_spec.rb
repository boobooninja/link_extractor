require 'spec_helper'

describe Job do

  it { should respond_to :page_count }
  it { should respond_to :page_count= }

  describe "#new_page" do
    it "adds to pages and sets current_page_number" do
      expect(subject.instance_variable_get(:@pages).length).to eq(0)
      subject.new_page
      expect(subject.instance_variable_get(:@pages).length).to eq(1)
      expect(subject.instance_variable_get(:@current_page_number)).to eq(0)
      subject.new_page
      expect(subject.instance_variable_get(:@pages).length).to eq(2)
      expect(subject.instance_variable_get(:@current_page_number)).to eq(1)
    end
  end

  describe "#page" do
    before do
      subject.page_count = 2
      subject.new_page
    end

    it "returns the current page" do
      current_page = subject.page
      expect(current_page).to be_a(Page)

      subject.new_page

      new_page = subject.page
      expect(new_page).not_to eq(current_page)
    end
  end

end

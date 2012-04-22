require 'spec_helper'

describe Category do
  before { @category = Category.new(title: "Some category") }

  subject { @category }

  it { should be_valid }
  it { should respond_to :title }
  it { should respond_to :offers }

  describe "with blank title" do
    before { @category.title = ' ' }
    it { should_not be_valid }
  end

  describe "with very long title" do
    before { @category.title = 'a' * 31 }
    it { should_not be_valid }
  end

  describe "with very short title" do
    before { @category.title = 'a' * 3 }
    it { should_not be_valid }
  end
end

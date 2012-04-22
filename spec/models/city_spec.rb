require 'spec_helper'

describe City do
  before { @city = City.new(name: "City") }

  subject { @city }

  it { should be_valid }
  it { should respond_to :name }
  it { should respond_to :vendors }
  it { should respond_to :offers }
  it { should respond_to :categories }

  describe "with blank title" do
    before { @city.name = " " }
    it { should_not be_valid }
  end

  describe "with too short title" do
    before { @city.name = 'a' * 2 }
    it { should_not be_valid }
  end

  describe "with too long title" do
    before { @city.name = 'a' * 21 }
    it { should_not be_valid }
  end
end

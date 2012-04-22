require 'spec_helper'

describe Vendor do
  before { @vendor = Vendor.new(name: "Example Vendor", email: "vendor@example.gr", username: "example",
                          password: "foobar", password_confirmation: "foobar" ) }

  subject { @vendor }

  it { should respond_to :name }
  it { should respond_to :username }
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_digest }
  it { should respond_to :password_confirmation }
  it { should respond_to :authenticate }

  it { should respond_to :offers }
  it { should respond_to :cities }
  it { should respond_to :categories }

  it { should be_valid }

  describe "when name is not present" do
    before { @vendor.name = ' ' }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @vendor.email = ' ' }
    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { @vendor.username = ' ' }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @vendor.password = @vendor.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe "when password does not match confirmation" do
    before { @vendor.password_confirmation = "not-the-same" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @vendor.name = 'a' * 21 }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @vendor.name = 'a' * 2 }
    it { should_not be_valid }
  end

  describe "remember token" do
    before { @vendor.save }
    its(:password_digest) { should_not be_blank }
  end
end
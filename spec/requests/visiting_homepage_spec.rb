# encoding: utf-8
require 'spec_helper'

describe "Visiting the homepage" do
  let!(:city) { FactoryGirl.create(:city) }

  subject { page }

  it "redirects to choose City" do
    visit '/'
    current_path.should == welcome_path
    should have_content 'Επιλέξτε την πόλη σας:'
  end

  it "takes you in" do
    visit '/'
    select city.name
    click_button 'Συνέχεια'
    visit '/'
    current_path.should == root_path
  end
end

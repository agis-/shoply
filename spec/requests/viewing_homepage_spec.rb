# encoding: utf-8
require 'spec_helper'

feature "Visiting the homepage" do
  let!(:city) { FactoryGirl.create(:city) }

  subject { page }

  context "new user" do
    it "redirects to choose City" do
      visit '/'
      current_path.should == welcome_path
      should have_content 'Επιλέξτε την πόλη σας:'
    end
  end

  context "returning user" do
    before do
      visit '/'
      select city.name
      click_button 'Συνέχεια'
      visit '/'
    end

    it "takes you in" do
      current_path.should == root_path
    end

    it "sets the selected City" do
      should have_css 'a.dropdown-toggle', text: city.name
    end

    it "defaults to all Vendors" do
      should have_css 'a.dropdown-toggle', text: 'Όλα τα Supermarkets'
    end

  end
end

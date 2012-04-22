# encoding: utf-8
require 'spec_helper'

feature "Viewing a City page" do
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:vendor) { FactoryGirl.create(:vendor) }

  subject { page }

  context "as a new user" do
    it "redirects you to choose City" do
      visit city_path(city)
      current_path.should == welcome_path
    end
  end

  context "as a returning user" do
    before do
      visit '/'
      select city.name
      click_button 'Συνέχεια'
      visit city_path(city)
    end

    it "takes you in" do
      current_path.should == city_path(city)
    end

    it "defaults to all vendors in the navbar" do
      should have_css 'a.dropdown-toggle', text: 'Όλα τα Supermarkets'
    end

    it "selects the correct City in the navbar" do
      should have_css 'a.dropdown-toggle', text: city.name
    end

    it "lists Offers from Vendors in that city" do
      # pending
    end
  end
end

# the vendors offers are listed
# displays the categories menu

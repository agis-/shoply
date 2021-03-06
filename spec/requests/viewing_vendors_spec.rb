# encoding: utf-8
require 'spec_helper'

feature "Viewing a Vendor page" do
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:vendor) { FactoryGirl.create(:vendor) }

  subject { page }

  context "as a new user" do
    it "redirects you to choose City" do
      visit vendor_path(vendor)
      current_path.should == welcome_path
    end
  end

  context "as a returning user" do
    before do
      visit '/'
      select city.name
      click_button 'Συνέχεια'
      visit vendor_path(vendor)
    end

    it "takes you in" do
      current_path.should == vendor_path(vendor)
    end

    it "sets the selected Vendor" do
      should have_css 'a.dropdown-toggle', text: vendor.name
    end


    it "displays the proper page title" do
      should have_selector 'title', text: vendor.name
    end

    it "displays the proper broadcast" do
      should have_css '.alert-success', text: vendor.broadcast
    end
  end
end

# check that the vendors offers are listed
# test for displays the categories menu
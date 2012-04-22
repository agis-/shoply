# encoding: utf-8
require 'spec_helper'

feature "Choosing a city" do
  let!(:city) { FactoryGirl.create(:city) }

  subject { page }

  scenario "takes you to the homepage with the selected city set" do
    visit '/'
    select city.name
    click_button 'Συνέχεια'
    current_path.should == root_path
    should have_css 'a.dropdown-toggle', text: city.name
    should have_css 'a.dropdown-toggle', text: 'Όλα τα Supermarkets'
  end
end

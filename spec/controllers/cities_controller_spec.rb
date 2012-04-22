require 'spec_helper'

describe CitiesController do
  describe "GET show" do
    let!(:city)   { FactoryGirl.create(:city) }

    describe "with city cookie NOT set" do
      it "redirects to welcome path" do
        get :show
        response.should redirect_to welcome_path
        assigns(:city).should == nil
      end
    end

    describe "with city cookie set" do
      it "lists all offers from the selected city" do
        cookies[:city_id] = city.id
        get :show
        response.should be_success
        response.should render_template 'show'
        assigns(:city).should == City.find(cookies[:city_id])
      end
    end

    # test for params?

  end
end
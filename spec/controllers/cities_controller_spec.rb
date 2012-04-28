require 'spec_helper'

describe CitiesController do
  let!(:city)   { FactoryGirl.create(:city) }

  describe "GET show" do
    context "as new user" do
      it "redirects to choose City" do
        get :show
        response.should redirect_to welcome_path
        assigns(:city).should be_nil
      end
    end

    context "as returning user" do
      it "lists all offers from the selected city" do
        cookies[:city_id] = city.id
        get :show
        response.should be_success
        response.should render_template 'show'
        assigns(:city).should == City.find(cookies[:city_id])
      end
    end
    # TODO test for params?
  end

  describe "GET expiring" do
    context "as new user" do
      it "redirects to choose City" do
        get :expiring
        response.should redirect_to welcome_path
        assigns(:city).should be_nil
      end
    end

    context "as returning user" do
      it "lists all offers in selected City" do
        cookies[:city_id] = city.id
        get :expiring
        response.should be_success
        response.should render_template 'show'
        assigns(:city).should == City.find(cookies[:city_id])
      end
    end
  end
end
# encoding: utf-8
require 'spec_helper'

describe OffersController do
  let!(:offer) { FactoryGirl.create(:offer) }
  let!(:city)   { FactoryGirl.create(:city) }

  describe "GET show" do
    context "new user" do
      it "redirects to choose City" do
        get :show
        response.should redirect_to welcome_path
        assigns(:offer).should be_nil
      end
    end

    context "returning user" do
      before do
        cookies[:city_id] = city.id
        get :show, id: offer.id
      end

      it "assigns the offer" do
        assigns(:offer).should == offer
      end

      it "assigns the vendor" do
        assigns(:vendor).should == offer.vendor
      end

      it "assigns more offers from vendor" do

      end
    end

  end
end
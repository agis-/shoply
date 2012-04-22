# encoding: utf-8
require 'spec_helper'

describe OffersController do
  let!(:offer) { FactoryGirl.create(:offer) }
  let!(:city)   { FactoryGirl.create(:city) }

  describe "GET show" do
    it "assigns the city" do
      cookies[:city_id] = city.id
      get :show, id: offer.id
      assigns(:offer).should == offer
    end
  end

end
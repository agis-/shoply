require 'spec_helper'

describe VendorsController do
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:offer)  { FactoryGirl.create(:offer, vendor_id: vendor.id)}

  describe "GET show" do
    context "new user" do
      it "redirects to choose City" do
        get :show
        response.should redirect_to welcome_path
        assigns(:vendor).should be_nil
      end
    end

    context "returning user" do
      before do
        cookies[:city_id] = city.id
        get :show, id: vendor.id
      end

      it "assigns the vendor" do
        assigns(:vendor).should == Vendor.find(vendor.id)
      end

      # assigns the Offers

    end
  end
end
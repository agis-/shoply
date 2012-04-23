class VendorsController < ApplicationController
  before_filter :redirect_if_no_cookie
  before_filter :set_vendor

  def show
    @vendor = Vendor.find(params[:id])
    if params[:c]
      @offers = @vendor.offers.active.where("category_id = ?", params[:c]).page(params[:page])
    else
      @offers = @vendor.offers.active.page(params[:page])
    end
  end

  def expiring
    @vendor = Vendor.find(params[:id])
    @offers = @vendor.offers.expiring.page(params[:page])
    render 'show'
  end

  private

  def set_vendor
    session[:vendor_id] = params[:id]
  end
end
class VendorsController < ApplicationController
  before_filter :redirect_if_no_cookie

  def show
    @vendor = Vendor.find(params[:id])
    if params[:c]
      @offers = @vendor.offers.active.where("category_id = ?", params[:c]).page(params[:page])
    else
      @offers = @vendor.offers.active.page(params[:page])
    end
    session[:vendor_id] = @vendor.id
  end

end
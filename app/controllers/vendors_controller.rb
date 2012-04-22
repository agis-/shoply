class VendorsController < ApplicationController
  before_filter :redirect_if_no_cookie

  def show
    category = params[:c]
    @vendor = Vendor.find(params[:id])

    if category
      @offers = @vendor.offers.active.where("category_id = #{category}").paginate(:page => params[:page])
    else
      @offers = @vendor.offers.active.paginate(:page => params[:page])
    end
    session[:vendor_id] = @vendor.id
  end

end
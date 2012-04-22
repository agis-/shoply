class OffersController < ApplicationController
  before_filter :redirect_if_no_cookie

  layout 'offer'

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
    @more_from_vendor = @vendor.offers.active.where("id != ?", params[:id]).limit(8)
    session[:vendor_id] = @vendor.id
  end
end
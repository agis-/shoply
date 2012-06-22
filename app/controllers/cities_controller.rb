class CitiesController < ApplicationController
  before_filter :redirect_if_no_cookie
  before_filter :set_cookie_and_params
  before_filter :reset_vendor

  def show
    @city = City.find(params[:id])
    if params[:c]
      @offers = @city.offers.active.where("category_id = ?", params[:c]).page(params[:page])
    else
      @offers = @city.offers.active.page(params[:page])
    end
  end

  def expiring
    @city = City.find(params[:id])
    @offers = @city.offers.expiring.page(params[:page])
    render 'show'
  end

  def welcome
    redirect_to root_path
  end

  protected

  def set_cookie_and_params
    if params.has_key?(:selected_city) # then he comes from the welcome page
      params[:id] = params[:selected_city][:id]
      cookies.permanent[:city_id] = params[:selected_city][:id]
    elsif params.has_key?(:id) # then city is already set
      cookies.permanent[:city_id] = params[:id]
    else # persist param[:id] also to the homepage
      params[:id] = cookies[:city_id] || City.first.id
    end
  end
end

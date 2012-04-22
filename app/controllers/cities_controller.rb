class CitiesController < ApplicationController
  before_filter :redirect_if_no_cookie
  before_filter :set_cookie_and_params
  before_filter :reset_vendor

  def show
    @city = City.find(params[:id])
    if params[:c]
      @offers = @city.offers.active.where("category_id = ?", params[:c]).paginate(page: params[:page])
    else
      @offers = @city.offers.active.paginate(page: params[:page])
    end
  end

  def welcome
    redirect_to root_path
  end

  protected
  def set_cookie_and_params
    if params.has_key?(:selected_city) # then he's coming from the welcome page
      params[:id]       = params[:selected_city][:id]
      cookies[:city_id] = params[:selected_city][:id]
    elsif params.has_key?(:id)         # then we dont have to set params[:id], it's already set
      cookies[:city_id] = params[:id]
    else                               # persist param[:id] also to the homepage
      params[:id] = cookies[:city_id] || City.first.id
    end
  end
end

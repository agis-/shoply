# encoding: utf-8

module ApplicationHelper
  def categories
    case controller_name
    when 'vendors'
      Vendor.find(params[:id]).categories
    when 'cities'
      City.find(params[:id]).categories
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def active_category
    Category.find(params[:c])
  end

  # def breadcrumbs
  #   case controller_name
  #   when 'vendors'
  #     heading = current_city.name + " › " + @vendor.name
  #     params[:c].nil? ? heading : heading + " › " + active_category.title
  #   when 'cities'
  #     heading = @city.name + " › " + "Όλα τα Supermarkets"
  #     params[:c].nil? ? heading : heading + " › " + active_category.title
  #   end
  # end
end

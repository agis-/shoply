class Admin::AdminController < ApplicationController
  before_filter :require_login

  include Admin::SessionsHelper

  layout 'admin'

  private

  def require_login
    unless logged_in?
      flash[:notice] = t(:login_required)
      redirect_to admin_login_path
    end
  end
end
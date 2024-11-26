class Admin::PagesController < ApplicationController
  # Requires authentication
  before_action :authenticate_user!

  # GET /admin/home
  def home
    # Only admin users can access this page
    if current_user.role_admin?
      render 'admin/pages/home'
    else
      redirect_to root_path
    end
  end
end

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :basic_auth, if: -> { Rails.env.production? }

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USERNAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def ensure_admin
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end

  def admin_required_for_modification
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end
end

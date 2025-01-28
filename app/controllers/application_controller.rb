class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception, prepend: true

  # Add security headers
  before_action :set_security_headers
  
  # Configure permitted parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit parameters for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    
    # Permit parameters for account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end

  private

  def set_security_headers
    # Add security headers
    response.headers['X-Frame-Options'] = 'SAMEORIGIN'
    response.headers['X-XSS-Protection'] = '1; mode=block'
    response.headers['X-Content-Type-Options'] = 'nosniff'
    response.headers['Referrer-Policy'] = 'strict-origin-when-cross-origin'
    
    # Only in production
    if Rails.env.production?
      response.headers['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
      response.headers['Content-Security-Policy'] = "default-src 'self'"
    end
  end

  # Handle common exceptions
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render file: 'public/404.html', status: :not_found, layout: false
  end

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    redirect_to root_path, alert: 'Invalid request. Please try again.'
  end
end

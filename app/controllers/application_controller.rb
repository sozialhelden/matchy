class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def access_denied(exception)
    redirect_to root_path, :alert => exception.message
  end

  # Notice it is important to cache the ability object so it is not
  # recreated every time.
  def current_ability
    @current_ability ||= ::Ability.new(current_admin_user)
  end

  def after_sign_in_path_for(resource_or_scope)
    admin_places_path # customize to your liking
  end

  def after_sign_out_path_for(resource_or_scope)
    '/' # customize to your liking
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_i18n_locale_from_params

  protected

    def current_moderator
      return unless session[:moderator_id]
      @current_moderator ||= Moderator.find_by_id(session[:moderator_id])
    end
  
    helper_method :current_moderator

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          #I18n.locale = params[:locale]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end
end

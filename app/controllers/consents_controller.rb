class ConsentsController < ApplicationController
  before_filter :verify_human

  def home
    if params[:locale] == "en"
      render "consents/home"
    else
      render "consents/home_es"
    end
  end

  def accept
    @user = User.new
  end

  def verify_human
#    redirect_to new_captcha_page_path unless session[:captcha]
  end

end

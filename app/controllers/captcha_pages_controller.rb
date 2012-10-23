class CaptchaPagesController < ApplicationController
  def new
    
  end

  def create
#    if verify_recaptcha
#      session[:captcha] = Time.now
#      if params[:locale] == :en
#        render 'consents/home'
#      else
#        render 'consents/home_es'
#      end
#    else
#      render :action => :new
#    end
    if simple_captcha_valid?
      session[:captcha] = Time.now
      if params[:locale] == "en"
        render 'consents/home'
      else
        render 'consents/home_es'
      end
    else
      render :action => :new
    end
  end

end

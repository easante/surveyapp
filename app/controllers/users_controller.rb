class UsersController < ApplicationController
  def index

  end

  def create
    user_ip = request.remote_ip
    user = User.find_by_ip_address(user_ip)
    answer = Answer.find_by_ip_address(user_ip)
    if user && answer
      flash[:notice] = t('users.thanks')
      render 'consents/thanks.html.erb'
      return false
    else
      @user = User.new(params[:user])
      @user.ip_address = user_ip
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = t('users.personal_details_saved')
        redirect_to new_survey_path
      else
        flash[:alert] = t('users.please_fill_out')
        render 'consents/accept.html.erb'
      end
    end
  end
end

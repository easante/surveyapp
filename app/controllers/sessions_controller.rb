class SessionsController < ApplicationController

  def new
  end

  def create
    moderator = Moderator.find_by_name(params[:session][:name])
    if moderator && moderator.authenticate(params[:session][:password])
      session[:moderator_id] = moderator.id
      redirect_to root_path, :notice => t(sessions.login_success)
    else
      flash.now[:alert] = t(sessions.login_failure)
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => t(sessions.logout_success)
  end

end

module SessionsHelper
  def signed_in?
    !current_moderator.nil?
  end
end

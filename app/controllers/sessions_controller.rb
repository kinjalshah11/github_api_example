class SessionsController < ApplicationController
  def new
    if current_user.present?
      redirect_to user_path(current_user)
    end
  end

  def create
  	user = User.from_omniauth(env["omniauth.auth"])
    if user.valid?
      session[:user_id] = user.id
      # redirect_to request.env['omniauth.origin']
      redirect_to user_path(current_user)
    end
  
  end

  def destroy
  	reset_session
    redirect_to root_path
  end
end

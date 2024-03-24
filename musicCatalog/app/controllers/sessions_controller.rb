class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(nickname: user_params[:nickname])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'You have successfully logged in'
    else
      flash[:alert] = "Wrong username or password"

      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: 'You have successfully logged out'
  end
end

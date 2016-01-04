class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.contractor
        redirect_to dashboard_user_path(user), notice: "Logged in!"
      else
        redirect_to owner_dashboard_user_path(user), notice: "Logged in!"
      end
    else
      flash[:alert] = "Wrong credentials!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end

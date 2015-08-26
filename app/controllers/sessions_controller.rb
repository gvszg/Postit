class SessionsController < ApplicationController
  def new 
  end

  def create
    user = User.where(username: params[:username]).first # find user
    if user && user.authenticate(params[:password]) # find user & password correct
      session[:user_id] = user.id # save user to session
      flash[:notice] = "Welcome, #{user.username} has logged in!"
      redirect_to root_path
    else
      flash[:error] = "There's something wrong with your username or password!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out!"
    redirect_to root_path
  end
end
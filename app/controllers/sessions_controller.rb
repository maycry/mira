class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:email], params[:password], :remember_me => true)
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      if user_exist?(params[:email])
        flash.now.alert = "Password  was invalid"
      else
        flash.now.alert = "Email was invalid"
      end
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
  
  private
  
  def user_exist?(email)
    !User.where(:email => email).blank?
  end

end

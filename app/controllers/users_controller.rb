class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end
  
  private
  
  def auto_login(user)
    session[:user_id] = user.id
    @current_user = user
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to products_url, notice: "Success!"
  	else
      flash.now[:error] = "I'm sorry."
      render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, error: "Logged out!"
  end
end

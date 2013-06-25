class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in
  	unless current_user
  		flash[:alert] = "You must be logged in."
  		redirect_to new_session_url
  	end
  end

  def sorted_by_date(reviews)
	  reviews.sort_by { |review| review.created_at }
  end

  helper_method :current_user, :sorted_by_date
end

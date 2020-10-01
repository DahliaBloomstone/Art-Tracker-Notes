class ApplicationController < ActionController::Base
  #built in mechanism to protect the application:  
  protect_from_forgery with: :exception
    include ApplicationHelper
  
  private
  
  #basic redirect method if user is not logged in 
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:danger] = "Please log in to Art Tracker!"
        redirect_to '/'
      end
    end
  end
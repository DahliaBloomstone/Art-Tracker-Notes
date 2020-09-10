class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper
  
  private
  
    def redirect_if_not_logged_in
      if !logged_in?
        flash[:danger] = "Please log in to Art Tracker!"
        redirect_to '/'
      end
    end
  end
module ApplicationHelper
  
  #helper method to ensure current user found by session user id
  def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    #helper method to ensure user is logged in during the session
    def logged_in?
      !!session[:user_id]
    # !!@current_user
    end
  
    #art project params match current art project by params
    def current_art_project
      @current_art_project ||= ArtProject.find_by_id(params[:art_project_id]) if params[:art_project_id]
    end
  
    #art plan match current art plan by params
    def current_art_plan
      @current_art_plan ||= ArtPlan.find_by_id(params[:art_plan_id]) if params[:art_plan_id]
    end
  end
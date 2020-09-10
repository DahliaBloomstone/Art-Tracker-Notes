module ApplicationHelper
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!session[:user_id]
    # !!@current_user
    end
  
    def current_art_project
      @current_art_project ||= ArtProject.find_by_id(params[:art_project_id]) if params[:art_project_id]
    end
  
    def current_art_plan
      @current_art_plan ||= ArtPlan.find_by_id(params[:art_plan_id]) if params[:art_plan_id]
    end
  end
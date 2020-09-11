class ArtSchedulesController < ApplicationController 
    before_action :set_art_schedules, only: [:edit, :update, :show, :delete]
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def index 
     if params[:art_project_id] && art_project = ArtProject.find_by_id(params[:art_project_id])
      @art_schedules = art_project.art_schedules.paginate(page: params[:page], per_page: 2)
        else
     @art_schedules = current_user.art_schedules.paginate(page: params[:page], per_page: 2)
        end
    end 

    def new 
    end 

    def create
    end 

    def show
    end 

    def edit 
    end 

    def update
    end 

    def destroy 
    end 

    params 

    def art_schedule_params
    end 

    def set_art_schedules 
    end 

    def require_same_user 
    end 
    
end 
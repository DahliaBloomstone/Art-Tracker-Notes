class ArtProjectsController < ApplicationController 
    before_action :set_art_project, only: [:show, :edit, :update]

    def index 
    if params[:art_plan_id] && artplan = ArtPlan.find_by_id(params[:art_plan_id])
    @art_projects = artplan.art_projects.paginate(page: params[:page], per_page: 2)
    else
     @art_projects = current_user.art_projects.paginate(page: params[:page], per_page: 2)
     end
end 

    def show 
    end 

    def edit
    end 

    def update 
        set_art_project
        redirect_if_not_logged_in 
        if @art_project.update(art_project_params)
            flash[:success] = "Your art project has been updated!"
            redirect_to art_project_path(@art_project)
        else 
            render :edit 
        end 
    end 


    private 
    def art_project_params 
    end 

    def set_art_project 
    end 

end 
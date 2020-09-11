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

    def update 
    end 

    private 
    def art_project_params 
    end 

    def set_art_project 
    end 

end 
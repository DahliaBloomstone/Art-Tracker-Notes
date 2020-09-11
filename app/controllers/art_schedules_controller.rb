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
        if current_user && params[:art_plan_id] && @artplan = ArtPlan.find_by_id(params[:art_plan_id])
     @art_schedule = @artplan.art_schedules.build
     @art_schedule.build_art_project
         else
     @art_schedule = ArtSchedule.new
     @art_schedule.build_art_project
        end
    end 

    def create
        @art_schedule = ArtSchedule.new(art_schedule_params)
      if @art_schedule.save
        flash[:success] = "Your art project schedule has been created! Start Working!"
        redirect_to art_schedule_path(@art_schedule)
      else
        render :new
      end
    end 

    def show
    end 

    def edit 
    end 

    def update
   if @art_schedule.update(art_schedule_params)
     flash[:success] = "Your art project schedule has been updated!"
     redirect_to art_schedule_path(@art_schedule)
     else
  render :edit
        end
    end 

    def destroy 
    @art_schedule.destroy
    flash[:success] = "You have successfully deleted this art schedule!"
    redirect_to art_schedules_path
    end 

    private  

    def art_schedule_params
    params.require(:art_schedule).permit(:art_time, :art_type, :art_id, :art_plan_id, art_attributes: [:medium, :idea, :artist_reference, :day, :content, :price])
    end 

    def set_art_schedules 
        @art_schedule = ArtSchedule.find_by(id: params[:id])
        if @art_schedule.nil?
          flash[:danger] = "This Art Project Schedule is not Found! Try Something Else!"
          redirect_to art_schedules_path
        end
    end 

    def require_same_user 
        set_art_schedules
        if current_user.id != @art_schedule.art_plan.user_id
          flash[:danger] = "You can only edit or delete your own art project schedule"
          redirect_to art_schedules_path
      end
    end 
    
end 